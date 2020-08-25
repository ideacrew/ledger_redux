# This migration comes from qbo (originally 20200820212512)
class AddItemIdToStaging < ActiveRecord::Migration[6.0]
    def change
        add_column :qbo_invoice_staging, :qbo_item_id, :bigint
    end
end
