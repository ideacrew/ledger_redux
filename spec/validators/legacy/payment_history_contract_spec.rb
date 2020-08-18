# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Legacy::PaymentHistoryContract do

  let(:ref_no)          { '9876543210' }
  let(:date_received)   { DateTime.now - 1.day }
  let(:amount)          { 11_222.33 }
  let(:payment_method)  { :ach }

  let(:customer_code)   { '3750755' }
  let(:payments)        { 
    [
      {
        ref_no: ref_no,
        customer_code: customer_code,
        date_received: date_received,
        amount: amount,
        payment_method: payment_method,
      }
    ]
  }

  let(:required_params)   { 
    {
      customer_code: customer_code,
      payments: payments,
    }
  }

  let(:optional_params)     { { } }
  let(:all_params)          { required_params.merge(optional_params) }

  context "Given invalid parameter scenarios" do
    context "with empty parameters" do
      it 'should list error for every required parameter' do
        result = subject.call({})

        expect(result.success?).to be_falsey
        expect(result.errors.to_h.keys).to match_array required_params.keys
      end
    end

    context "with optional parameters only" do
      it { expect(subject.call(optional_params).success?).to be_falsey }
      it { expect(subject.call(optional_params).error?(required_params.first[0])).to be_truthy }
    end
  end

  context "Given valid parameters" do
    context "and required parameters only" do
      it { expect(subject.call(required_params).success?).to be_truthy }
      it { expect(subject.call(required_params).to_h).to eq required_params }
    end

    context "and all required and optional parameters" do
      it "should pass validation" do
        result = subject.call(all_params)

        expect(result.success?).to be_truthy
        expect(result.to_h).to eq all_params
      end
    end
  end
  
end
