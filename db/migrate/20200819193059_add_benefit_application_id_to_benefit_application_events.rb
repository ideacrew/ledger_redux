class AddBenefitApplicationIdToBenefitApplicationEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :benefit_application_events, :benefit_application_id, :integer
    add_index :benefit_application_events, :benefit_application_id
  end
end
