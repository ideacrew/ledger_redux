require 'rails_helper'

RSpec.describe Subscribers::Acapi::CoverageSelected do

  let(:event_name) {nil}
  let(:e_start) {nil}
  let(:e_end) {nil}
  let(:msg_id) {nil}
  let(:payload) { File.read('spec/support/coverage_selected.xml')}

  context "Given all valid params" do
    it "should create a member created event" do
      result = subject.call(event_name, e_start, e_end, msg_id, payload)
      expect(Events::Member::Created.all.size).not_to eq 0
    end

    it "should create a member" do
      result = subject.call(event_name, e_start, e_end, msg_id, payload)
      expect(Member.all.size).not_to eq 0
    end
  end
end
