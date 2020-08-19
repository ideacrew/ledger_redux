class CreateBenefitApplicationEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :benefit_application_events do |t|
      t.string :type, null: false
      t.string :hbx_id, null: false
      
      t.text :data, null: false
      t.text :metadata, null: false
      t.datetime :created_at, null: false

      t.index :hbx_id
    end
  end
end
