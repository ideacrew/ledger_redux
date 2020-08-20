# frozen_string_literal: true

module Customers
  class Customer < Dry::Struct

    attribute :"GivenName",                      Types::Strict::String.meta(omittable: false)
    attribute :"DisplayName",                    Types::Strict::String.meta(omittable: true)
    attribute :"FullyQualifiedName",             Types::Strict::String.meta(omittable: true)
    attribute :"CompanyName",                    Types::Strict::String.meta(omittable: true)
    attribute :"FamilyName",                     Types::Strict::String.meta(omittable: true)

    attribute :"Id",                             Types::Strict::String.meta(omittable: true)
    attribute :"SyncToken",                      Types::Strict::String.meta(omittable: true)
    attribute :"domain",                         Types::Strict::String.meta(omittable: true)

    attribute :"BillWithParent",                 Types::Bool.meta(omittable: true)
    attribute :"sparse",                         Types::Bool.meta(omittable: true)

    attribute :"BillAddr",                       Locations::Address.optional.meta(omittable: true)

    attribute :"PrimaryEmailAddr", Dry::Struct.meta(omittable: true) do
      attribute :"Address",                      Types::Strict::String.meta(omittable: true)
    end

    attribute :"PrimaryPhone", Dry::Struct.meta(omittable: true) do
      attribute :"FreeFormNumber",               Types::Strict::String.meta(omittable: true)
    end
    
    attribute :"Active",                         Types::Bool.meta(omittable: true)
    attribute :"MetaData",                       Types::Hash.meta(omittable: true)
    attribute :"Job",                            Types::Bool.meta(omittable: true)
    attribute :"Taxable",                        Types::Bool.meta(omittable: true)

    attribute :"BalanceWithJobs",                Types::Float.meta(omittable: true)
    attribute :"Balance",                        Types::Float.meta(omittable: true)
    attribute :"PrintOnCheckName",               Types::Strict::String.meta(omittable: true)
    attribute :"PreferredDeliveryMethod",        Types::Strict::String.meta(omittable: true)

  end
end
