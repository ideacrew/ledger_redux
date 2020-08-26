module Qbo::SubCustomers
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(payload)
      parent_ref   = yield get_parent_customer(payload)
      params       = yield serialize(payload, parent_ref)
      values       = yield validate(params)
      sub_customer = yield create(values, payload)

      Success(sub_customer)
    end

    private

    def serialize(payload, parent_ref)
      params = {
        "DisplayName": "#{payload[:first_name]} #{payload[:last_name]} (#{payload[:hbx_id]})",
        "GivenName": payload[:first_name],
        "FamilyName": payload[:last_name],
        "CompanyName": payload[:employer_legal_name],
        "PrimaryTaxIdentifier": payload[:fein],
        "ParentRef": {"value": parent_ref },
        "Job": true,
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

    def get_parent_customer(payload)
      Try { Qbo::CustomerMap.find_by(fein: payload[:fein])&.quickbooks_customer_id }
    end
  
    def validate(params)
      Try { Qbo::Customers::SubCustomerContract.new.call(params) }
    end

    def create_customer_map(params)
      Qbo::CustomerMap.create!(
        quickbooks_customer_id: params[:Id],
        external_id: params[:ExternalId],
        resource: "sub_customer"
      )
    end

    def create_sub_customer(params)
      Qbo::SubCustomer.create!(params)
    end

    def create(values, payload)
      response = Try { Qbo::QuickbooksConnect.call.create(:customer, payload: values.to_h) }

      if response.success?
        params = response.to_result.value!.merge!({PrimaryTaxIdentifier: payload[:fein], ExternalId: payload[:hbx_id] }).deep_symbolize_keys
        create_customer_map(params)
        create_sub_customer(params)

        response.to_result
      else
        response.to_result
      end
    end
  end
end
