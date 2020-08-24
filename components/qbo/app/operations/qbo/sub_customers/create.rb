module Qbo::SubCustomers
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(payload)
      params       = yield serialize(payload)
      parent_ref   = yield get_parent_customer(params)
      values       = yield validate(params, parent_ref)
      sub_customer = yield create(values)

      Success(sub_customer)
    end

    private

    def serialize(payload)
      member = payload[:enrollment_event][:event][:body][:enrollment_event_body][:affected_members][:affected_member][:member]
      employer = payload[:enrollment_event][:event][:body][:enrollment_event_body][:enrollment][:policy][:enrollment][:shop_market][:employer_link]
      params = {
        "ExternalId": member[:primary_family_id][:id],
        "PrimaryTaxIdentifier": employer[:fein],
        "DisplayName": "#{member[:person][:person_name][:person_given_name]} #{member[:person][:person_name][:person_surname]} (#{member[:primary_family_id][:id]})",
        "GivenName": member[:person][:person_name][:person_given_name],
        "FamilyName": member[:person][:person_name][:person_surname],
        "CompanyName": employer[:name],

        "BillAddr": { "Line1": "#{member[:person][:addresses][:address][:address_line_1]} #{member[:person][:addresses][:address][:address_line_2]}",
                      "City": member[:person][:addresses][:address][:location_city_name],
                      "PostalCode": member[:person][:addresses][:address][:postal_code],
                    },
        "PrimaryEmailAddr": {"Address": member[:person][:emails][:email].first[:email_address] },
        "PrimaryPhone": {"FreeFormNumber":  member[:person][:phones][:phone][:full_phone_number] },
        "Taxable": false
      }

      Success(params)
    end

    def get_parent_customer(params)
      Try { Qbo::CustomerMap.find_by(fein: params[:PrimaryTaxIdentifier])&.quickbooks_customer_id }
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
