# frozen_string_literal: true

module Subscribers::Acapi

  class CoverageSelected < ::Acapi::Subscription
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
      member = yield create(attributes.to_h)

      Success(member)
    end

    def self.subscription_details
      ["acapi.info.events.hbx_enrollment.coverage_selected"]
    end

    private

    def transform_xml(payload)
      result = Ox.load(payload, mode: :hash_no_attrs).deep_symbolize_keys!
      Success(result)
    end

    def map_attributes(params)
      body = params[:enrollment_event][:event][:body][:enrollment_event_body]

      body[:affected_members][:affected_member].tap do |attrs|
        @result = {
          effective_date: attrs[:benefit][:begin_date].to_date,
          total_premium: attrs[:benefit][:premium_amount],
          subscriber_id: attrs[:member][:id][:id]
        }
      end

      @result[:coverage_kind] = body[:enrollment][:policy][:enrollment][:plan][:coverage_type]
      @result[:payload] = params
      Success(@result)
    end

    def validate(values)
      Members::MemberContract.new.call(values)
    end

    def create(attributes)
      Try { Commands::Member::Create.call(effective_date: attributes[:effective_date], coverage_kind: attributes[:coverage_kind], subscriber_id: attributes[:subscriber_id], total_premium: attributes[:total_premium], payload: attributes[:payload]) }.to_result
    end
  end
end
