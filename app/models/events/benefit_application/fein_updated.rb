# frozen_string_literal: true

class Events::BenefitApplication::FeinUpdated < Events::BenefitApplication::BaseEvent

  data_attributes :hbx_id, :fein

  def apply(benefit_application)
    benefit_application.hbx_id      = hbx_id
    benefit_application.fein        = fein

    benefit_application
  end

end