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

    def create_customer_map(params)
      Qbo::CustomerMap.create!(
        quickbooks_customer_id: params["Id"],
        external_id: params["PrimaryTaxIdentifier"],
        resource: "sub_customer"
      )
    end

    def create_sub_customer(params)
      Qbo::SubCustomer.create!(params)
    end

    def create(values)
      response = Try { Qbo::QuickbooksConnect.call.create(:customer, payload: values.to_h) }

      if response.success?
        params = response.to_result.value!.merge!({"PrimaryTaxIdentifier": values.to_h[:PrimaryTaxIdentifier]})
        create_customer_map(params)
        create_sub_customer(params)

        response.to_result
      else
        response.to_result
      end
    end
  end
end
