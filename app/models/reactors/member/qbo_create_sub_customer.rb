class Reactors::Member::QboCreateSubCustomer

  def self.call(event)
    Qbo::SubCustomers::Create.new.call(event.payload)
  end
end
