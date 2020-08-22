module Qbo::Legacy
  class AccountStatusSerialize
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(params)
      qbo_customer   = yield get_customer(params)
      data           = yield serialize(qbo_customer)
      values         = yield validate(data)
      account_status = yield create_entity(values)

      Success(account_status)
    end

    private

    def get_customer(params)
      Qbo::Customers::GetCustomer.new.call(params)
    end

    def serialize(qbo_customer)
      data = {
        "past_due": "0",
        "previous_balance": "0",
        "new_charges": "0",
        "adjustments": "0",
        "payments": "0",
        "total_due": qbo_customer["Balance"].to_s,
        "statement_date": nil,
        "adjustment_items": [],
        "payment_history": []
      }

      Success(data)
    end

    def validate(data)
      Qbo::Legacy::CustomerStatusContract.new.call(data)
    end

    def create_entity(params)
      Try { Qbo::Legacy::CustomerStatus.new(params.to_h) }  
    end
  end
end
