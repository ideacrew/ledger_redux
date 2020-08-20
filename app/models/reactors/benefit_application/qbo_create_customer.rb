class Reactors::BenefitApplication::QboCreateCustomer 

  def self.call(event)
    Qbo::Customers::Create.new.call(event.payload)
  end
end
