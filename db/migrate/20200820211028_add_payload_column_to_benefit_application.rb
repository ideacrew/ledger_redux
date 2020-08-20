class AddPayloadColumnToBenefitApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :benefit_applications, :payload, :text
  end
end
