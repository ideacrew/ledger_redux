module Qbo::Vendors
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(params)
      values  = yield validate(params)
      vendor  = yield create(values)

      Success(vendor)
    end

    private

    def validate(params)
      Try { Qbo::Vendors::VendorContract.new.call(params) }
    end

    def create(values)
      response = Try { Qbo::QuickbooksConnect.call.create(:vendor, payload: values.to_h) }
      if response.success?
        params = response.to_result.value!
        Qbo::Vendor.create!(params)

        response.to_result
      else
        response.to_result
      end
    end
  end
end