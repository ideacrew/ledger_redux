# frozen_string_literal: true

module FatFreeCrm::Accounts
  class Account < Dry::Struct

    attribute :name,                        Types::Strict::String.meta(omittable: false)
    attribute :fein,                        Types::Strict::String.meta(omittable: false)
    attribute :hbx_id,                      Types::Strict::String.meta(omittable: false)

    attribute :billing_address_attributes,  FatFreeCrm::Locations::Address.meta(omittable: true)
    attribute :email,                       LedgerRedux::Types::Email.meta(omittable: true)
    attribute :phone,                       Types::String.meta(omittable: true)
    attribute :fax,                         Types::String.meta(omittable: true)

    attribute :division_name,               Types::String.meta(omittable: true)   # HQ, Region, Agency, Department
    attribute :division_kind,               Types::String.meta(omittable: true)   # HQ, Region, Agency, Department

    attribute :website,                     Types::String.meta(omittable: true)
    attribute :linkedin,                    Types::String.meta(omittable: true)
    attribute :facebook,                    Types::String.meta(omittable: true)
    attribute :twitter,                     Types::String.meta(omittable: true)
    attribute :category,                    Types::String.meta(omittable: true)

    attribute :contacts_count,              Types::Coercible::Integer.meta(omittable: true)
    attribute :opportunities_count,         Types::Coercible::Integer.meta(omittable: true)

    attribute :access,                      Types::String.meta(omittable: true)
    attribute :background_info,             Types::String.meta(omittable: true)

    attribute :created_at,                  Types::DateTime.meta(omittable: true)
    attribute :updated_at,                  Types::DateTime.meta(omittable: true)
    attribute :deleted_at,                  Types::DateTime.meta(omittable: true)

  end
end
