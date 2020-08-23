module Qbo::SubCustomers
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(fein, params)
      parent_ref = yield get_parent_customer(fein)
      values    = yield validate(params, parent_ref)
      sub_customer  = yield create(values)

      Success(sub_customer)
    end

    private

    def get_parent_customer(fein)
      Try { Qbo::CustomerMap.find_by(fein: fein)&.quickbooks_customer_id }
    end
  
    def validate(values, parent_ref)
      params = values.merge({ParentRef: parent_ref})
      Try { Qbo::Customers::CustomerContract.new.call(params) }
    end

    def create(values)
      response = Try { Qbo::QuickbooksConnect.call.create(:customer, payload: values.to_h) }
      response.to_result
    end
  end
end
