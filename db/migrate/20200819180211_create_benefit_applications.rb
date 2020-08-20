class CreateBenefitApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :benefit_applications do |t|
      t.string :hbx_id, null: false
      t.string :legal_name
      t.string :dba
      t.string :fein, null: false

      t.timestamps null: false
    end
  end
end
