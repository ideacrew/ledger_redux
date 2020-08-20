class Events::BenefitApplication::BaseEvent < Lib::BaseEvent
  self.table_name = "benefit_application_events"

  belongs_to :benefit_application, class_name: "::BenefitApplication", autosave: false
end