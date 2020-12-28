# frozen_string_literal: true

module AcapiEvents
  class BenefitCoverageInitialApplicationEligibleContract < ApplicationContract
    params do
      required(:employer_id).filled(:string)
      required(:plan_year_id).filled(:string)
      optional(:workflow_id).maybe(:string)
    end
  end
end
