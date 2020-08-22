# frozen_string_literal: true

module Qbo::Legacy
  class PaymentHistory < Dry::Struct
      
    attribute :amount,                           Types::String.optional.meta(omittable: false)
    attribute :reference_id,                     Types::String.optional.meta(omittable: false)
    attribute :paid_on,                          Types::String.optional.meta(omittable: false)
    attribute :method_kind,                      Types::String.optional.meta(omittable: false)
  end
end