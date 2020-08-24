# frozen_string_literal: true

class Events::Member::Created < Events::Member::BaseEvent

  data_attributes :effective_date, :coverage_kind, :subscriber_id, :total_premium, :payload

  def apply(member)
    member.effective_date      = effective_date
    member.coverage_kind       = coverage_kind
    member.subscriber_id       = subscriber_id
    member.total_premium       = total_premium
    member.payload             = payload

    member
  end
end
