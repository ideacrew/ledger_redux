module Qbo::Invoices
  module InvoiceStaging
    class Create 
      send(:include, Dry::Monads[:result, :do])
      send(:include, Dry::Monads[:try])

      def call(payload)
        params          = yield serialize(payload)
        values          = yield validate(params)
        entity          = yield create_entity(values)
        invoice_staging = yield create_invoice_staging(entity)

        Success(invoice_staging)
      end

      private

      def serialize(payload)
        policy = payload[:enrollment_event][:event][:body][:enrollment_event_body][:enrollment][:policy]

        params = {
          sub_customer_last_name: policy[:enrollees][:enrollee][:member][:person][:person_name][:person_surname],
          sub_customer_external_id: policy[:enrollees][:enrollee][:member][:person][:id][:id].split("#").last,
          customer_external_id: policy[:enrollment][:shop_market][:employer_link][:id][:id].split("#").last,
          plan_name: policy[:enrollment][:plan][:name] ,
          coverage_type: policy[:enrollment][:plan][:coverage_type].split("#").last,
          premium_amount: policy[:enrollment][:premium_total_amount].to_f,
          benefit_begin_date: policy[:enrollees][:enrollee][:benefit][:begin_date].to_date,
        }

        Success(params)
      end

      def validate(params)
        Try { Qbo::Invoice::InvoiceStagingContract.new.call(params) }
      end

      def create_entity(values)
        Try { Qbo::Invoice::InvoiceStaging.new(values.to_h) }
      end

      def create_invoice_staging(entity)
        Try { ::Qbo::InvoiceStaging.create!(entity.to_h) }
      end
    end
  end
end
