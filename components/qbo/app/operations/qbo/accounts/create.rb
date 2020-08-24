module Qbo::Accounts
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
      Try { Qbo::Accounts::AccountContract.new.call(params) }
    end

    def create(values)
      response = Try { Qbo::QuickbooksConnect.call.create(:account, payload: values.to_h) }
      if response.success?
        params = response.to_result.value!
        Qbo::Account.create!(params)

        response.to_result
      else
        response.to_result
      end
    end
  end
end
