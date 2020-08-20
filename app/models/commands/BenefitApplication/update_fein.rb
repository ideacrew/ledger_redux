# frozen_string_literal: true

module Commands
  class BenefitApplication::UpdateFein
    include Lib::Command

    attributes :hbx_id, :fein, :metadata

    private def build_event
      Events::BenefitApplication::FeinUpdated.new(
        hbx_id: hbx_id,
        fein: fein,
        metadata: metadata
      )
    end

    private 
    
    def noop?
      fein == benefit_application.fein
    end
  end
end
