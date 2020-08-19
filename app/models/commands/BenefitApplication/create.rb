# frozen_string_literal: true

module Commands
  class BenefitApplication::Create
    include Lib::Command

    attributes :hbx_id, :fein, :legal_name, :dba, :metadata

    private def build_event
      Events::BenefitApplication::Created.new(
        hbx_id: hbx_id,
        fein: fein,
        dba: dba,
        legal_name: legal_name,
        metadata: metadata
      )
    end
  end
end
