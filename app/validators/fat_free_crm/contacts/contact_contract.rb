# frozen_string_literal: true

module FatFreeCrm::Contacts
  class ContactContract < ApplicationContract

    params do

      optional(:id).filled(:integer)
      optional(:account_id).filled(:integer)

      optional(:first_name).filled(:string)
      optional(:last_name).filled(:string)
      optional(:preferred_name).filled(:string)
      optional(:born_on).filled(:date)
      optional(:hired_on).filled(:date)
      optional(:ssn).maybe(:string)
      optional(:gender).filled(CovidMost::Types::GenderKind)
      optional(:preferred_language).maybe(:string)
      optional(:used_interpreter).filled(CovidMost::Types::YesNoUnknownKind)
      optional(:category).filled(:string)

      optional(:addresses).array(:hash)
      optional(:outreach_priority).maybe(:integer)

      optional(:access).maybe(:string)    
      optional(:title).maybe(:string)     
      optional(:department).maybe(:string)
      optional(:source).maybe(:string)    
      optional(:reports_to).maybe(:integer)

      optional(:email).maybe(CovidMost::Types::Email)
      optional(:alt_email).maybe(CovidMost::Types::Email)
      optional(:phone).maybe(CovidMost::Types::PhoneNumber) 
      optional(:mobile).maybe(CovidMost::Types::PhoneNumber)

      optional(:linkedin).maybe(:string)
      optional(:facebook).maybe(:string)
      optional(:twitter).maybe(:string)
      optional(:do_not_call).maybe(:bool)
      optional(:background_info).maybe(:string)

      optional(:tag_list).array(:string)

      optional(:created_at).maybe(:date)
      optional(:updated_at).maybe(:date)
      optional(:deleted_at).maybe(:date)
    end
  end
end
