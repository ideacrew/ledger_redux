module Qbo::Customers
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(params)
      values  = yield validate(params)
      customer = yield create(values)

      Success(customer)
    end

    private

    def validate(params)
      Try { Qbo::Customers::CustomerContract.new.call(params) }
    end

    def create(values)
      response = Try { Qbo::QuickbooksConnect.call.create(:customer, payload: values.to_h) }
      if response.success?
        params = response.to_result.value!
        Qbo::CustomerMap.create!(quickbooks_customer_id: params["Id"] , fein: values.to_h[:PrimaryTaxIdentifier])
        response.to_result
      else
        response.to_result
      end
    end
  end
end
