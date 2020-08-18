# frozen_string_literal: true

module Legacy

  # Schema and validation rules for the {Legacy::Payment} entity
  class PaymentContract < ApplicationContract

    # @!method call(opts)
    # @param [Hash] opts the parameters to validate using this contract
    # @option opts [String] 'ref_no' (required)
    # @option opts [String] 'customer_code' (required)
    # @option opts [Date] 'date_received' (required)
    # @option opts [Decimal] 'amount' (required)
    # @option opts [Symbol] 'payment_method' (required)

    # @option opts [String] 'payee_name' (optional)
    # @option opts [String] 'cheque_no' (optional)
    # @option opts [String] 'address1' (optional)
    # @option opts [String] 'address2' (optional)
    # @option opts [String] 'city' (optional)
    # @option opts [String] 'state' (optional)
    # @option opts [String] 'zip' (optional)
    # @option opts [String] 'payment_transaction_id' (optional)
    # @return [Dry::Monads::Result] Result

    params do
      required(:ref_no).filled(:string)
      required(:customer_code).filled(:string)
      required(:date_received).filled(:date)
      required(:amount).filled(:decimal)
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
