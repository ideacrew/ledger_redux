module Qbo::Items
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call
      plans           = yield get_uniq_plan_names
      params          = yield get_params(plans)
      values          = yield validate(params)
      items           = yield create_item(values)

      Success(items)
    end

    private

    def get_uniq_plan_names
      Try { Qbo::InvoiceStaging.distinct.pluck(:plan_name, :coverage_type) }
    end

    def get_params(plans)
      params = plans.collect do |plan|
        account_name = plan[1].upcase + " SHOP"
        id = Qbo::QuickbooksConnect.call.query("Select * from Account where name = '#{account_name}'").first["Id"]
        {
          "Name": plan[0],
          "IncomeAccountRef": {
            "value": id
          }, 
          "Type": "Service"
        }
      end

      Success(params)
    end

    def validate(params)
      values = params.collect do |param|
        Qbo::Items::ItemContract.new.call(param).to_h
      end

      Success(values)
    end

    def update_invoice_staging(item)
      invoice_stagings = Qbo::InvoiceStaging.where(plan_name: item[:"Name"])
      invoice_stagings.each do |invoice_staging|
        invoice_staging.update!(qbo_item_id: item[:"Id"] )
      end
    end

    def create_item(values)
      items = values.collect do |value|
        response = Try { Qbo::QuickbooksConnect.call.create(:item, payload: value) }
        if response.success?
          update_invoice_staging(response.to_result.value!)
          response.to_result
        else
          response.to_result
        end
      end

      Success(items)
    end
  end
end
