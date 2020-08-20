require 'rails_helper'

RSpec.describe BenefitApplication, type: :model do

  let(:fein)          { "587458514" }
  let(:updated_fein)  { "888888888" }
  let(:legal_name)    { "ACME Widgets, Inc" }
  let(:hbx_id)        { "202001" }

  let(:easter_egg)  { "a special placeholder for future payloads" }
  let(:christmas)  { "yes yes" }

  let(:metadata)    { { easter_egg: easter_egg } }
  let(:payload)    { {christmas: christmas} }

  context "Given all valid params" do
    it "should create a new instance" do 
      Commands::BenefitApplication::Create.call(hbx_id: hbx_id, fein: fein, legal_name: legal_name, payload: payload)
      expect(BenefitApplication.first!.fein).to eq fein
    end

    it "should update the fein attribute" do
      Commands::BenefitApplication::UpdateFein.call(hbx_id: hbx_id, fein: updated_fein, metadata: metadata)
      expect(BenefitApplication.first!.fein).to eq updated_fein
    end
  end

end
