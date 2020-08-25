# frozen_string_literal: true
module FatFreeCrm::Contacts
  class Contact < Dry::Struct

    attribute :first_name,                Types::Strict::String.meta(omittable: false)
    attribute :last_name,                 Types::Strict::String.meta(omittable: false)
    attribute :preferred_name,            Types::Strict::String.meta(omittable: true)
    attribute :hbx_id,                    Types::Strict::String.meta(omittable: false)

    attribute :addresses,                 Types::Array.of(FatFreeCrm::Locations::Address).meta(omittable: true)
    attribute :outreach_priority,         Types::Coercible::Integer.meta(omittable: true)
    attribute :category,                  Types::String.meta(omittable: true)
    
    attribute :born_on,                   Types::Date.meta(omittable: true)
    attribute :hired_on,                  Types::Date.meta(omittable: true)
    attribute :ssn,                       Types::String.meta(omittable: true)

    attribute :gender,                    LedgerRedux::Types::GenderKind.meta(omittable: true)
    attribute :preferred_language,        Types::String.meta(omittable: true)
    attribute :used_interpreter,          LedgerRedux::Types::YesNoUnknownKind.meta(omittable: true)
    
    attribute :email,                     LedgerRedux::Types::Email.meta(omittable: true)
    attribute :alt_email,                 LedgerRedux::Types::Email.meta(omittable: true)
    attribute :phone,                     Types::String.optional.meta(omittable: true)
    attribute :mobile,                    Types::String.optional.meta(omittable: true)

    attribute :access,                    Types::String.meta(omittable: true)
    attribute :title,                     Types::String.meta(omittable: true)
    attribute :department,                Types::String.meta(omittable: true)
    attribute :source,                    Types::String.meta(omittable: true)
    attribute :reports_to,                Types::Coercible::Integer.meta(omittable: true)

    attribute :linkedin,                  Types::String.meta(omittable: true)
    attribute :facebook,                  Types::String.meta(omittable: true)
    attribute :twitter,                   Types::String.meta(omittable: true)
    attribute :do_not_call,               Types::Bool.meta(omittable: true)
    attribute :background_info,           Types::String.meta(omittable: true)

    attribute :tag_list,                  Types::Array.of(Types::String).meta(omittable: true)

    attribute :created_at,                Types::DateTime.meta(omittable: true)
    attribute :updated_at,                Types::DateTime.meta(omittable: true)
    attribute :deleted_at,                Types::DateTime.meta(omittable: true)

  end
end
