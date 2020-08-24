class Reactors::Member::QboCreateSubCustomer

  def self.call(event)
    Qbo::SubCustomers::Create.new.call
  end
end
