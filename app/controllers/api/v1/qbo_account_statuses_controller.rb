module Api::V1
  class QboAccountStatusesController < ApplicationController

    def payment_history
      render xml: {}
    end

    def current_statement_service
      render xml: {}
    end
    
  end
end
