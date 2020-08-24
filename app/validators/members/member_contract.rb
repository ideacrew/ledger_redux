# frozen_string_literal: true

module Members

  # Schema and validation rules for the {Member} entity
  class MemberContract < ApplicationContract

    # @!method call(opts)
    # @param [Hash] opts the parameters to validate using this contract
    # @option opts [Date] 'effective_date' (required)
    # @option opts [String] 'coverage_kind' (required)
    # @option opts [String] 'subscriber_id' (required)
    # @option opts [String] 'total_premium' (required)
    # @option opts [Decimal] 'payload' (required)
    # @return [Dry::Monads::Result] Result

    params do
      required(:effective_date).filled(:date)
      required(:coverage_kind).filled(:string)
      required(:subscriber_id).filled(:string)
      required(:total_premium).filled(:string)
      required(:payload).filled(:hash)
    end
  end

end
