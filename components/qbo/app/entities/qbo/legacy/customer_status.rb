# frozen_string_literal: true

module Qbo::Legacy
  class CustomerStatus < Dry::Struct


    attribute :past_due,                           Types::String.optional.meta(omittable: false)
    attribute :previous_balance,                   Types::String.optional.meta(omittable: false)
    attribute :new_charges,                        Types::String.optional.meta(omittable: false)
    attribute :adjustments,                        Types::String.optional.meta(omittable: false)
    attribute :payments,                           Types::String.optional.meta(omittable: false)
    attribute :total_due,                          Types::String.optional.meta(omittable: false)
    attribute :statement_date,                     Types::Date.optional.meta(omittable: false)

    attribute :adjustment_items, Types::Array do
      attribute :amount,                           Types::String.optional.meta(omittable: true)
      attribute :name,                             Types::String.optional.meta(omittable: true)
      attribute :description,                      Types::String.optional.meta(omittable: true)
      attribute :posting_date,                     Types::String.optional.meta(omittable: true)
      attribute :is_passive_renewal,               Types::Bool.optional.meta(omittable: true)
    end

    attribute :payment_history,                    Types::Array.of(Qbo::Legacy::PaymentHistory).optional.meta(omittable: false)

  end
end

{
  "past_due": "0",
  "previous_balance": "1051.92",
  "new_charges": "350.64",
  "adjustments": "0",
  "payments": "-1051.92",
  "total_due": "350.64",
  "statement_date": "01/03/2019",
  "adjustment_items": [
    {
      "amount": "100",
      "name": "Some name",
      "description": "BlueDental Preferred High",
      "posting_date": "01/03/2019",
      "is_passive_renewal": "true"
    }
  ],
  "payment_history": [
    {
      "amount": "1051.92",
      "reference_id": "3025768644",
      "paid_on": "2018-12-3:0:00",
      "method_kind": "ACH"
    },
    {
      "amount": "701.28",
      "reference_id": "3022648327",
      "paid_on": "2018-09-2:0:00",
      "method_kind": "ACH"
    }
  ]
}