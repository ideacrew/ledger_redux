# frozen_string_literal: true

# Added
    # attribute :division_name,       Types::String.meta(omittable: true)   # HQ, Region, Agency, Department
    # attribute :contacts,            Accounts::AccountContact.optional.meta(omittable: true)
    # attribute :website,             Types::String.meta(omittable: true)
    # attribute :fax,                 LedgerRedux::Types::PhoneNumber.meta(omittable: true)
    # attribute :addresses,           Types::Array.of(Locations::Address).meta(omittable: true)
    # attribute :facility,            Facilities::Facility.optional.meta(omittable: true)
    # attribute :opportunities,       Accounts::AccountsOpportunities.optional.meta(omittable: true)
    # attribute :facility,            Facilities::Facility.optional.meta(omittable: true)

# Dropped
    # attribute :lead,                Leads::Lead.optional.meta(omittable: true)
    # attribute :mobile,              LedgerRedux::Types::PhoneNumber.meta(omittable: true)
    # attribute :alt_email,           LedgerRedux::Types::Email.meta(omittable: true)
    # attribute :date_of_birth,       Types::Date.meta(omittable: true)
    # attribute :title,               Types::String.meta(omittable: true)
    # attribute :department,          Types::String.meta(omittable: true)
    # attribute :source,              Types::String.meta(omittable: true)
    # attribute :do_not_call,         Types::Bool.meta(omittable: true)

module FatFreeCrm::Accounts
  class Account < Dry::Struct

    attribute :access,              Types::String.meta(omittable: true)
    # attribute :subscribed_users,    Types::Array.of(Users::User).meta(omittable: true)

    attribute :name,                Types::Strict::String.meta(omittable: false)
    attribute :division_name,       Types::String.meta(omittable: true)   # HQ, Region, Agency, Department
    attribute :division_kind,       Types::String.meta(omittable: true)   # HQ, Region, Agency, Department

    attribute :addresses,           Types::Array.of(Locations::Address).meta(omittable: true)
    attribute :email,               LedgerRedux::Types::Email.meta(omittable: true)
    attribute :phone,               LedgerRedux::Types::PhoneNumber.meta(omittable: true)
    attribute :fax,                 LedgerRedux::Types::PhoneNumber.meta(omittable: true)

    attribute :website,             Types::String.meta(omittable: true)
    attribute :linkedin,            Types::String.meta(omittable: true)
    attribute :facebook,            Types::String.meta(omittable: true)
    attribute :twitter,             Types::String.meta(omittable: true)
    attribute :category,            Types::String.meta(omittable: true)

    attribute :contacts_count,      Types::Coercible::Integer.meta(omittable: true)
    attribute :opportunities_count, Types::Coercible::Integer.meta(omittable: true)

    attribute :background_info,     Types::String.meta(omittable: true)

    attribute :created_at,          Types::DateTime.meta(omittable: true)
    attribute :updated_at,          Types::DateTime.meta(omittable: true)
    attribute :deleted_at,          Types::DateTime.meta(omittable: true)

  end
end
