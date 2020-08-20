# frozen_string_literal: true

class Events::BenefitApplication::Created < Events::BenefitApplication::BaseEvent

  data_attributes :hbx_id, :fein, :legal_name, :payload

  def apply(benefit_application)
    benefit_application.hbx_id      = hbx_id
    benefit_application.fein        = fein
    benefit_application.legal_name  = legal_name
    benefit_application.payload    = payload

    benefit_application
  end

end