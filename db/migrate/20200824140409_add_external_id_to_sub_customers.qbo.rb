# This migration comes from qbo (originally 20200824095912)
class AddExternalIdToSubCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :qbo_sub_customers, :ExternalId, :string
  end
end
