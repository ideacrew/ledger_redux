# This migration comes from qbo (originally 20200820212512)
class AddCustomerMapResource < ActiveRecord::Migration[6.0]
    def change
        add_column :qbo_customer_maps, :resource, :string
    end
end
