module Qbo::Customers
  class GetCustomer 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(params)
      id  = yield get_qbo_customer_id(params[:fein])
      qbo_customer = yield get_customer(id)

      Success(qbo_customer)
    end

    private

    def get_qbo_customer_id(fein)
      Try { Qbo::CustomerMap.find_by(fein: fein)&.quickbooks_customer_id }
    end

    def get_customer(id)
      Try { Qbo::QuickbooksConnect.call.get(:customer, id) }
    end
  end
end
