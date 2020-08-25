# frozen_string_literal: true

module FatFreeCrm::Accounts
  class AccountContract < ApplicationContract

    params do

      required(:name).filled(:string)
      required(:fein).filled(:string)
      required(:hbx_id).filled(:string)

      optional(:billing_address_attributes).filled(:hash)
      optional(:email).maybe(LedgerRedux::Types::Email)
      optional(:phone).maybe(:string)
      optional(:fax).maybe(:string)

      optional(:division_name).maybe(:string)
      optional(:division_kind).maybe(:string)

      optional(:access).maybe(:string)
      optional(:website).maybe(:string)
      optional(:linkedin).maybe(:string)
      optional(:facebook).maybe(:string)
      optional(:twitter).maybe(:string)
      optional(:category).maybe(:string)

      optional(:contacts_count).filled(:integer)
      optional(:opportunities_count).filled(:integer)

      optional(:background_info).maybe(:string)

      optional(:created_at).maybe(:date_time)
      optional(:updated_at).maybe(:date_time)
      optional(:deleted_at).maybe(:date_time)
    end
  end
end
