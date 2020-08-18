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
      required(:ref_no).filled(:string)
      required(:customer_code).filled(:string)
      required(:date_received).filled(:date)
      required(:amount).filled(:string)
      required(:payment_method).filled(:symbol)

      optional(:payee_name).maybe(:string)
      optional(:cheque_no) .maybe(:string)
      optional(:address1).maybe(:string)
      optional(:address2).maybe(:string)
      optional(:city).maybe(:string)
      optional(:state).maybe(:string)
      optional(:zip).maybe(:string)
      optional(:payment_transaction_id).maybe(:string)
    end
  end

end
