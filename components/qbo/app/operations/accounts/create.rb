module Accounts
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(params)
      values  = yield validate(params)
      account = yield create(values)

      Success(account)
    end

    private

    def validate(params)
      Try { Accounts::AccountContract.new.call(params) }
    end

    def create(values)
      response = Try { Qbo::QuickbooksConnect.call.create(:account, payload: values.to_h) }
      response.to_result      
    end
  end
end
