module FatFreeCrm::Accounts
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(payload)
      params    = yield serialize(payload)
      values    = yield validate(params)
      entity    = yield create_entity(values)
      account   = yield create(entity)

      Success(account)
    end

    private

    def serialize(payload)
      params = {
        name: payload[:employer_legal_name],
        fein: payload[:fein],
        hbx_id: payload[:hbx_id],
        email: payload[:email],
        phone: payload[:phone],
        billing_address_attributes: {street1: payload[:address][:address_1], street2: payload[:address][:address_2],
                                     city: payload[:address][:city], state: payload[:address][:state], address_type: "Billing",
                                     zipcode: payload[:address][:address_1], country: payload[:address][:country_name] }
      }

      Success(params)
    end

    def validate(params)
      Try { FatFreeCrm::Accounts::AccountContract.new.call(params) }
    end

    def create_entity(values)
      Try { FatFreeCrm::Accounts::Account.new(values.to_h) }
    end

    def create(entity)
      Try { FatFreeCrm::Account.create!(entity.to_h) }
    end
  end
end
