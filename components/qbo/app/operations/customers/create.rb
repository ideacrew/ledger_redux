module Customers
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
      Try { Customers::CustomerContract.new.call(params) }
    end

    def create(values)
      response = Try { Qbo::QuickbooksConnect.call.create(:customer, payload: values.to_h) }
      response.to_result      
    end
  end
end
