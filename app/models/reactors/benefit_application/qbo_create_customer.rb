class Reactors::BenefitApplication::QboCreateCustomer 

  def self.call(event)
    Rails.logger.info {"*** Processing Customers Operation -- #{event}"}
    Qbo::Customers::Create.new.call(event.payload)
  end
end
