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
        params = {
          sub_customer_last_name: payload[:last_name],
          sub_customer_external_id: payload[:hbx_id],
          customer_external_id: payload[:employer_hbx_id],
          plan_name: payload[:plan_name],
          coverage_type: payload[:coverage_kind],
          premium_amount: payload[:premium_amount].to_f,
          benefit_begin_date: payload[:benefit_begin_date].to_date,
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
