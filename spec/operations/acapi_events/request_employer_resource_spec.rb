# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AcapiEvents::RequestEmployerResource do

  describe "given bogus parameters" do
    let(:params) { Hash.new }

    it "fails with error messages" do
      result = AcapiEvents::RequestEmployerResource.new.call(params)
      expect(result.success?).to be_falsey
      expect(result.failure.kind_of?(Hash)).to be_truthy
    end
  end

  describe "given valid parameters, but the service request times out" do
    let(:params) do
      {
        :employer_id => "employer id",
        :plan_year_id => "plan year id"
      }
    end

    before(:each) do
      allow(Acapi::Requestor).to receive(:request).with(
        "resource.employer",
        params,
        30
      ).and_raise(Timeout::Error.new)
    end

    it "fails for :timeout" do
      result = AcapiEvents::RequestEmployerResource.new.call(params)
      expect(result.success?).to be_falsey
      expect(result.failure).to eq :timeout
    end
  end

  describe "given valid parameters, but the service request returns a different error" do
    let(:params) do
      {
        :employer_id => "employer id",
        :plan_year_id => "plan year id",
        :workflow_id => "some workflow id"
      }
    end

    let(:response) do
      {
        :return_status => "404",
        :body => "COULDN'T FIND IT"
      }
    end

    before(:each) do
      allow(Acapi::Requestor).to receive(:request).with(
        "resource.employer",
        params,
        30
      ).and_return(response)
    end

    it "fails for :timeout" do
      result = AcapiEvents::RequestEmployerResource.new.call(params)
      expect(result.success?).to be_falsey
      expect(result.failure.code).to eq "404"
    end
  end

  describe "given valid parameters, which succeeds" do
    let(:params) do
      {
        :employer_id => "employer id",
        :plan_year_id => "plan year id",
        :workflow_id => "some workflow id"
      }
    end

    let(:response) do
      {
        :return_status => "200",
        :body => "THE XML RESOURCE"
      }
    end

    before(:each) do
      allow(Acapi::Requestor).to receive(:request).with(
        "resource.employer",
        params,
        30
      ).and_return(response)
    end

    it "fails for :timeout" do
      result = AcapiEvents::RequestEmployerResource.new.call(params)
      expect(result.success?).to be_truthy
      expect(result.value!).to eq "THE XML RESOURCE"
    end
  end
end