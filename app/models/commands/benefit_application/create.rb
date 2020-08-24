# frozen_string_literal: true

module Commands
  class BenefitApplication::Create
    include Lib::Command

    attributes :hbx_id, :fein, :legal_name, :payload

    private def build_event
      Events::BenefitApplication::Created.new(
        hbx_id: hbx_id,
        fein: fein,
        legal_name: legal_name,
        payload: payload
      )
    end
  end
end
