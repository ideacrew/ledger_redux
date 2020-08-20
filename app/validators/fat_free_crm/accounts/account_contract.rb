# frozen_string_literal: true

module FatFreeCrm::Accounts
  class AccountContract < ApplicationContract

    params do

      required(:name).filled(:string)

      optional(:division_name).maybe(:string)
      optional(:division_kind).maybe(:string)

      optional(:access).maybe(:string)

      optional(:addresses).array(:hash)
      optional(:email).maybe(LedgerRedux::Types::Email)
      optional(:phone).maybe(LedgerRedux::Types::PhoneNumber)
      optional(:fax).maybe(LedgerRedux::Types::PhoneNumber)

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
