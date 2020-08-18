# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Legacy::CurrentStatementContract do

  let(:status)            { 'Success' }
  let(:message)           { 'Last Statement' }

  let(:customer_code)     { '3750755' }
  let(:total_due)         { 11_223.50 }
  let(:past_due)          { 0.00 }
  let(:previous_balance)  { 11_223.50 }
  let(:new_charges)       { 11_223.50 }
  let(:adjustments)       { 0.00 }
  let(:payments)          { 11_223.50 }
  let(:statement_date)    { Date.today }


  let(:required_params)   { 
    {
      status: status,
      message: message,
      customer_code: customer_code,
      total_due: total_due,
      past_due: past_due,
      previous_balance: previous_balance,
      new_charges: new_charges,
      adjustments: adjustments,
      payments: payments,
      statement_date: statement_date,
    } 
  }

  let(:optional_params)     { {} }
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
