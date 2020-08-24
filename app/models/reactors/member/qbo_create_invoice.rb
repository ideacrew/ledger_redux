class Reactors::Member::QboCreateInvoice

  def self.call(event)
    Qbo::Invoices::InvoiceStaging::Create.new.call(event.payload)
  end
end