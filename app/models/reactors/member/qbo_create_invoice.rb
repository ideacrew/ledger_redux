class Reactors::Member::QboCreateInvoice

  def self.call(event)
    Rails.logger.info {"*** Processing Invoice Operation -- #{event}"}
    Qbo::Invoices::InvoiceStaging::Create.new.call(event.payload)
  end
end