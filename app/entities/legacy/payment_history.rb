# frozen_string_literal: true

class Legacy::PaymentHistory < Dry::Struct

  attribute :customer_code,     Types::String.meta(omittable: false)
  attribute :payments,          Types::Array.of(Legacy::Payment).meta(omittable: false)

end