class CreateQboCustomerMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :qbo_customer_maps do |t|
      t.string :external_id
      t.string :quickbooks_customer_id
      t.string :fein

      t.timestamps
    end
  end
end
