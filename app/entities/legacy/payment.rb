# frozen_string_literal: true

class Legacy::Payment < Dry::Struct

  attribute :customer_code,           Types::String.meta(omittable: false)
  attribute :ref_no,                  Types::String.meta(omittable: false)
  attribute :date_received,           Types::DateTime.meta(omittable: false)
  attribute :amount,                  Types::Decimal.meta(omittable: false)
  attribute :payment_method,          Types::Symbol.meta(omittable: false)   

  attribute :payee_name,              Types::String.meta(omittable: true)
  attribute :cheque_no,               Types::String.meta(omittable: true)
  attribute :address1,                Types::String.meta(omittable: true)
  attribute :address2,                Types::String.meta(omittable: true)
  attribute :city,                    Types::String.meta(omittable: true)
  attribute :state,                   Types::String.meta(omittable: true)
  attribute :zip,                     Types::String.meta(omittable: true)
  attribute :payment_transaction_id,  Types::String.meta(omittable: true)

end