class Legacy::CurrentStatement < Dry::Struct

  attribute :status,            Types::String.meta(omittable: false)
  attribute :message,           Types::String.meta(omittable: false)

  attribute :customer_code,     Types::String.meta(omittable: false)
  attribute :total_due,         Types::Decimal.meta(omittable: false)
  attribute :past_due,          Types::Decimal.meta(omittable: false)
  attribute :previous_balance,  Types::Decimal.meta(omittable: false)
  attribute :new_charges,       Types::Decimal.meta(omittable: false)
  attribute :adjustments,       Types::Decimal.meta(omittable: false)
  attribute :payments,          Types::Decimal.meta(omittable: false)
  attribute :statement_date,    Types::Date.meta(omittable: false)

end