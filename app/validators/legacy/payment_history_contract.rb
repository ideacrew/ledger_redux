# frozen_string_literal: true

module Legacy

  # Schema and validation rules for the {Legacy::PaymentHistory} entity
  class PaymentHistoryContract < ApplicationContract

    # @!method call(opts)
    # @param [Hash] opts the parameters to validate using this contract
    # @option opts [String] 'Name' (required)
    # @option opts [String] 'status' (required)
    # @option opts [String] 'message' (required)
    # @option opts [String] 'customer_code' (required)
    # @option opts [Decimal] 'total_due' (required)
    # @option opts [Decimal] 'past_due' (required)
    # @option opts [Decimal] 'previous_balance' (required)
    # @option opts [Decimal] 'new_charges' (required)
    # @option opts [Decimal] 'adjustments' (required)
    # @option opts [Decimal] 'pauyments' (required)
    # @option opts [Date] 'statement_date' (required)
    # @return [Dry::Monads::Result] Result

    params do
      required(:customer_code).filled(:string)
      required(:payments).array(:hash)
    end

    rule(:payments).each do |key, value|
      if key? && value
        result = Legacy::Payment.new.call(value)
        key.failure(text: "invalid payment", error: result.errors.to_h) if result&.failure?
      end
    end
  end

end
