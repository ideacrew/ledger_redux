class Reactors::Member::QboCreateSubCustomer

  def self.call(event)
    Rails.logger.info {"*** Processing SubCustomers Operation -- #{event}"}
    Qbo::SubCustomers::Create.new.call(event.payload)
  end
end
