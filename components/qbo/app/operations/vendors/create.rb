module Vendors
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
      Try { Vendors::VendorContract.new.call(params) }
    end

    def create(values)
      response = Try { AwsConnection.create_user(values.to_h) }
      response.to_result      
    end
  end
end