# frozen_string_literal: true

module AcapiEvents
  class RequestEmployerResource
    send(:include, Dry::Monads[:result, :do])

    def call(params)
      validation_result = yield validate_params(params)
      request_resource(validation_result)
    end

    protected

    def validate_params(params)
      validation = AcapiEvents::BenefitCoverageInitialApplicationEligibleContract.new.call(params)
      if validation.success?
        Success(validation.values.to_hash)
      else
        Failure(validation.errors.to_hash)
      end
    end

    def request_resource(request_params)
      begin
        request_response = Acapi::Requestor.request("resource.employer", request_params, 30)
        if request_response.nil?
          return Failure(:timeout)
        end
        r_code = request_response.stringify_keys["return_status"]
        r_body = request_response.stringify_keys["body"]
        if r_code == "200"
          Success(r_body)
        else
          resource_error = AcapiEvents::ResourceError.new({
            code: r_code,
            errors: request_response.stringify_keys
          })
          Failure(resource_error)
        end
      rescue Timeout::Error => e
        Failure(:timeout)
      end
    end
  end
end