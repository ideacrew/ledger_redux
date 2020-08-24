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
      address = payload[:organization][:office_locations][:office_location][:address]
      contact = payload[:organization][:contacts][:contact]

      params = {
        "ExternalId": payload[:organization][:id][:id],
        "PrimaryTaxIdentifier": payload[:organization][:fein],
        "DisplayName": "#{payload[:organization][:name]} (#{payload[:organization][:id][:id]})",

        "BillAddr": { "Line1": "#{address[:address_line_1]} #{address[:address_line_1]}",
                      "City": address[:location_city_name],
                      "PostalCode": address[:postal_code],
                    },
        "PrimaryEmailAddr": {"Address": contact[:emails][:email][:email_address] },
        "PrimaryPhone": {"FreeFormNumber": contact[:phones][:phone][:full_phone_number] },
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
        external_id: params["ExternalId"]
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
