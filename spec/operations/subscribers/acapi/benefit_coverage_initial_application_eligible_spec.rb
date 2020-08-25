require 'rails_helper'

RSpec.describe Subscribers::Acapi::BenefitCoverageInitialApplicationEligible do

  let(:event_name) {nil}
  let(:e_start) {nil}
  let(:e_end) {nil}
  let(:msg_id) {nil}
  let(:payload) { File.read('spec/support/benefit_coverage_initial_application_eligible.xml')}

  context "Given all valid params" do
    it "should create an benefit application created event" do
      # result = subject.call(event_name, e_start, e_end, msg_id, payload)
      # expect(Events::BenefitApplication::Created.all.size).not_to eq 0
    end

    it "should create a benefit application" do
      # result = subject.call(event_name, e_start, e_end, msg_id, payload)
      # expect(BenefitApplication.all.size).not_to eq 0
    end
  end
end
