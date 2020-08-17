# frozen_string_literal: true

module Accounts

  # Schema and validation rules for the {CallCenter::Operations::Contacts::ListFlow} operation
  class AccountContract < ApplicationContract

    # @!method call(opts)
    # @param [Hash] opts the parameters to validate using this contract
    # @option opts [String] 'Name' (required)
    # @option opts [Array<CallCenter::Types::ContactFlow>] :contact_flow_types
    # @return [Dry::Monads::Result::Success] if params pass validation
    # @return [Dry::Monads::Result::Failure] if params fail validation
    json do
      # required(:sample).value(format?: /^a/)

      required(:"Name").filled(max_size?: 100)

      # required for update
      optional(:"Id").value(:string)
      optional(:"SyncToken").value(:string)

      optional(:"AcctNum").value(:string, max_size?: 7)
      optional(:"AccountType").value(:string)
      optional(:"AccountSubType").value(:string)

      optional(:"CurrencyRef").hash do 
        required(:"value").filled(:string)
        optional(:"name").value(:string)
      end

      optional(:"ParentRef").hash do 
        required(:"value").filled(:string)
        optional(:"name").value(:string)
      end

      optional(:"Description").value(:string, max_size?: 100)
      optional(:"Active").value(:bool)
      optional(:"MetaData").value(:hash)

      optional(:"SubAccount").value(:bool)

      optional(:"FullyQualifiedName").value(:string)
      optional(:domain).value(:string)
      optional(:"Classification").value(:string)
      optional(:"CurrentBalanceWithSubAccounts").value(:decimal)
      optional(:sparse).value(:bool)
      optional(:"CurrentBalance").value(:integer)
    end
  end
end
