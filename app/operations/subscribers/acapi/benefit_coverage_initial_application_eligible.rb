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
      params = yield transform_xml(payload)
      values = yield map_attributes(params)
      attributes = yield validate(values)
      benefit_application = yield create(attributes)

      Success(benefit_application)
    end

    def self.subscription_details
      ["acapi.info.events.employer.benefit_coverage_initial_application_eligible"]
    end

    private

    def transform_xml(payload)
      Ox.load(payload, mode: :hash_no_attrs).deep_symbolize_keys!
    end

    def map_attributes(params)
      result = params[:organization].tap do |attrs|
        {
          hbx_id: attrs[:id][:id],
          fein: attrs[:fein],
          legal_name: attrs[:name]
        }
      end

      result[:payload] = params
      Success(result)
    end

    def validate(values)
      BenefitApplications::BenefitApplicationContract.new.call(values)
    end

    def create(attributes)
      Try { Commands::BenefitApplication::Create.call(hbx_id: hbx_id, fein: fein, legal_name: legal_name, payload: payload) }.to_result
    end
  end
end
