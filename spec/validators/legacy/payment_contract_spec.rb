# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Legacy::PaymentContract do

  let(:ref_no)          { '9876543210' }
  let(:customer_code)   { '3750755' }
  let(:date_received)   { DateTime.now - 1.day }
  let(:amount)          { 11_222.33 }
  let(:payment_method)  { :ach }

  let(:payee_name)              { nil }
  let(:cheque_no)               { nil }
  let(:address1)                { nil }
  let(:address2)                { nil }
  let(:city)                    { nil }
  let(:state)                   { nil }
  let(:zip)                     { nil }
  let(:payment_transaction_id)  { nil }

  let(:required_params)   { 
    {
      ref_no: ref_no,
      customer_code: customer_code,
      date_received: date_received,
      amount: amount,
      payment_method: payment_method,
    }
  }

  let(:optional_params)     { 
    { 
      payee_name: payee_name,
      cheque_no: cheque_no,
      address1: address1,
      address2: address2,
      city: city,
      state: state,
      zip: zip,
      payment_transaction_id: payment_transaction_id,
    } 
  }

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
