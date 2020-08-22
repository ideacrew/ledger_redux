module Api::V1
  class QboAccountStatusesController < ApplicationController

    def account_status
      if params["fein"]
        result = Qbo::Legacy::AccountStatusSerialize.new.call(params.permit!)
        if result.success?
          render json: result.value!
        else
          render json: result.failure
        end
      else
        render json: {message: "FEIN Missing"}
      end
    end

    def payment_history
      render json: {}
    end

    def current_statement_service
      render json: {}
    end
    
  end
end
