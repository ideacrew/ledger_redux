module Qbo::Customers
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(payload)
      params    = yield serialize(payload)
      values    = yield validate(params)
      customer  = yield create(values)

      Success(customer)
    end

    private

    def serialize(payload)

      params = {
        "ExternalId": payload[:hbx_id],
        "PrimaryTaxIdentifier": payload[:fein],
        "DisplayName": "#{payload[:employer_legal_name]} (#{payload[:hbx_id]})",

        "BillAddr": { "Line1": "#{payload[:address][:address_1]} #{payload[:address][:address_2]}",
                      "City": payload[:address][:city],
                      "PostalCode": payload[:address][:zip],
                    },
        "PrimaryEmailAddr": {"Address": payload[:email] },
        "PrimaryPhone": {"FreeFormNumber": payload[:phone] },
        "Taxable": false
      }

      Success(params)
    end

    def validate(params)
      Try { Qbo::Customers::CustomerContract.new.call(params) }
    end

    def create_customer_map(params)
      Qbo::CustomerMap.create!(
        quickbooks_customer_id: params["Id"],
        fein: params["PrimaryTaxIdentifier"],
        external_id: params["ExternalId"],
        resource: "customer"
      )
    end

    def create_customer(params)
      Qbo::Customer.create!(params)
    end

    def create(values)
      response = Try { Qbo::QuickbooksConnect.call.create(:customer, payload: values.to_h) }
      if response.success?
        params = response.to_result.value!.merge!({"PrimaryTaxIdentifier": values.to_h[:PrimaryTaxIdentifier], "ExternalId": values.to_h[:ExternalId] })
        create_customer_map(params)
        create_customer(params)

        response.to_result
      else
        response.to_result
      end
    end
  end
end
