# frozen_string_literal: true

module Subscribers
  class BenefitCoverageInitialApplicationEligibleSubscriber
    include Acapi::Notifiers

    def self.worker_specification
      Acapi::Amqp::WorkerSpecification.new(
        :queue_name => "benefit_coverate_initial_application_eligible_subscriber",
        :kind => :topic,
        :routing_key => "info.events.employer.benefit_coverage_initial_application_eligible"
      )
    end

    def work_with_params(body, delivery_info, properties)
      headers = properties.headers || {}
      stringed_payload = headers.stringify_keys
      employer_id = stringed_payload["employer_id"]
      plan_year_id = stringed_payload["plan_year_id"]
      workflow_id = stringed_payload["workflow_id"]
      request_result = AcapiEvents::RequestEmployerResource.new.call({
        employer_id: employer_id,
        plan_year_id: plan_year_id,
        workflow_id: workflow_id
      })
      if !request_result.success?
        case request_result.failure
        when ::Acapi::ResourceError
          failure = request_result.failure
          notify(
            "acapi.error.application.ledger_redux.sponsor_event.resource_error",
            {
              :return_status => failure.code,
              :employer_id => employer_id,
              :plan_year_id => plan_year_id,
              :workflow_id => workflow_id,
              :body => JSON.dump(
                {
                  headers: stringed_payload.to_hash,
                  errors: failure.errors.to_hash
                }
              )
            }
          )
          return :error     
        when :timeout
          notify(
            "acapi.error.application.ledger_redux.sponsor_event.resource_timeout",
            {
              :return_status => "503",
              :employer_id => employer_id,
              :plan_year_id => plan_year_id,
              :workflow_id => workflow_id,
              :body => JSON.dump(
                {
                  headers: stringed_payload.to_hash
                }
              )
            }
          )
          return :error
        else
          notify(
            "acapi.error.application.ledger_redux.invalid_sponsor_event.benefit_coverage_initial_application_eligible",
            {
              :return_status => "422",
              :employer_id => employer_id,
              :plan_year_id => plan_year_id,
              :workflow_id => workflow_id,
              :body => JSON.dump(
                {
                  headers: stringed_payload.to_hash,
                  errors: request_result.failure.to_hash
                }
              )
            }
          )
          return :ack
        end
      end
      
      :ack
    end

    def validate_params(emp_id, py_id, workflow_id)
      AcapiEvents::BenefitCoverageInitialApplicationEligibleContract.new.call(
        {
          employer_id: emp_id,
          plan_year_id: py_id,
          workflow_id: workflow_id
        }
      )
    end
  end
end
