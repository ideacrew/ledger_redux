module FatFreeCrm::Contacts
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(payload)
      params   = yield serialize(payload)
      values   = yield validate(params)
      entity   = yield create_entity(values)
      contact  = yield create(entity, payload[:fein])

      Success(contact)
    end

    private

    def serialize(payload)
      params = {
        first_name: payload[:first_name],
        last_name: payload[:last_name],
        hbx_id: payload[:hbx_id],
        phone: payload[:phone],
        email: payload[:email]
      }

      Success(params)
    end

    def validate(params)
      Try { FatFreeCrm::Contacts::ContactContract.new.call(params) }
    end

    def create_entity(values)
      Try { FatFreeCrm::Contacts::Contact.new(values.to_h) }
    end

    def create_account_contact(account, contact)
      Try { FatFreeCrm::AccountContact.create!(account_id: account.id , contact_id: contact.id)}
    end

    def create(entity, fein)
      contact = Try { FatFreeCrm::Contact.create!(entity.to_h) }

      if contact.success?
        account = FatFreeCrm::Account.where(fein: fein).first
        create_account_contact(account, contact) if account
        contact.to_result
      else
        contact.to_result
      end
    end
  end
end
