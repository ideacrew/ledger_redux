# frozen_string_literal: true

module Subscribers::Acapi

  class BenefitCoverageInitialApplicationEligible < ::Acapi::Subscription
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    # @param [String] event_name
    # @param [String] e_start
    # @param [String] e_end
    # @param [String] msg_id
    # @param [String] payload
    # @return [Dry::Monad::Result<ResourceRegistry::Feature>] monad_result
    def call(event_name, e_start, e_end, msg_id, payload)
      Rails.logger.info {"*** Processing benefit_coverage_initial_application_eligible payload -- #{payload}"}
      values = yield map_attributes(payload)
      attributes = yield validate(values)
      benefit_application = yield create(attributes.to_h)

      Success(benefit_application)
    end

    def self.subscription_details
      ["acapi.info.events.employer.benefit_coverage_initial_application_eligible"]
    end

    private

    def transform_xml(payload)
      result = Ox.load(payload, mode: :hash_no_attrs).deep_symbolize_keys!
      Success(result)
    end

    def map_attributes(payload)
      result = {
        hbx_id: payload[:hbx_id],
        fein: payload[:fein],
        legal_name: payload[:employer_legal_name],
        payload: payload
      }

      Success(result)
    end

    def validate(values)
      BenefitApplications::BenefitApplicationContract.new.call(values)
    end

    def create(attributes)
      Rails.logger.info {"*** Processing Benefit Application Command -- #{attributes}"}
      Try { Commands::BenefitApplication::Create.call(hbx_id: attributes[:hbx_id], fein: attributes[:fein], legal_name: attributes[:legal_name], payload: attributes[:payload]) }.to_result
    end
  end
end
