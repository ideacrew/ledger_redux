require 'rails_helper'
require 'pry'

RSpec.describe Subscribers::Acapi::BenefitCoverageInitialApplicationEligible do

  let(:fein)          { "587458514" }
  let(:updated_fein)  { "888888888" }
  let(:legal_name)    { "ACME Widgets, Inc" }
  let(:hbx_id)        { "202001" }

  let(:easter_egg)  { "a special placeholder for future payloads" }
  let(:christmas)  { "yes yes" }

  let(:metadata)    { { easter_egg: easter_egg } }
  let(:payload)    { {christmas: christmas} }

  let(:event_name) {nil}
  let(:e_start) {nil}
  let(:e_end) {nil}
  let(:msg_id) {nil}
  let(:payload) { File.read('spec/support/benefit_coverage_initial_application_eligible.xml')}

  context "Given all valid params" do
    it "should create an benefit application created event" do
      result = subject.call(event_name, e_start, e_end, msg_id, payload)
      expect(Events::BenefitApplication::Created.all.size).not_to eq 0
    end
  end
end