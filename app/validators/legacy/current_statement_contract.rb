# frozen_string_literal: true

module Legacy

  # Schema and validation rules for the {Legacy::CurrentStatement} entity
  class CurrentStatementContract < ApplicationContract

    # @!method call(opts)
    # @param [Hash] opts the parameters to validate using this contract
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
      required(:status).filled(:string)
      required(:message).filled(:string)
      required(:customer_code).filled(:string)
      required(:total_due).filled(:decimal)
      required(:past_due).filled(:decimal)
      required(:previous_balance).filled(:decimal)
      required(:new_charges).filled(:decimal)
      required(:adjustments).filled(:decimal)
      required(:payments).filled(:decimal)
      required(:statement_date).filled(:date)
    end
  end

end
