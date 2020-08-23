# frozen_string_literal: true

module BenefitApplications

  # Schema and validation rules for the {BenefitApplication} entity
  class BenefitApplicationContract < ApplicationContract

    # @!method call(opts)
    # @param [Hash] opts the parameters to validate using this contract
    # @option opts [String] 'hbx_id' (required)
    # @option opts [String] 'fein' (required)
    # @option opts [String] 'legal_name' (required)
    # @option opts [Decimal] 'payload' (required)
    # @return [Dry::Monads::Result] Result

    params do
      required(:hbx_id).filled(:string)
      required(:fein).filled(:string)
      required(:legal_name).filled(:string)
      required(:payload).filled(:hash)
    end
  end

end
