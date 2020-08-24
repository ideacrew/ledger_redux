# frozen_string_literal: true

module Commands
  class Member::Create
    include Lib::Command

    attributes :effective_date, :coverage_kind, :subscriber_id, :total_premium, :payload

    private def build_event
      Events::Member::Created.new(
        effective_date: effective_date,
        coverage_kind: coverage_kind,
        subscriber_id: subscriber_id,
        total_premium: total_premium,
        payload: payload
      )
    end
  end
end
