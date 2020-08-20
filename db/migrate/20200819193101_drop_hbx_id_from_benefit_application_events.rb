class DropHbxIdFromBenefitApplicationEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :benefit_application_events, :hbx_id, :integer
    # remove_index :benefit_application_events, name: 'index_benefit_application_events_on_hbx_id'
  end
end
