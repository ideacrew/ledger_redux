module Subscribers
  class ProcessAccounts < ::Acapi::Subscription

    def self.subscription_details
      ["acapi.info.events.employer.organization_employer_profile_added"]
    end

    def call(event_name, e_start, e_end, msg_id, payload)
      values = Events::AccountsImporter.new(payload).values
      # Initializa an operation which will validate and run this through entities before processing accounts.
    end
  end
end
