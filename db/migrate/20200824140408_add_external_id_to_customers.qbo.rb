# This migration comes from qbo (originally 20200824095812)
class AddExternalIdToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :qbo_customers, :ExternalId, :string
  end
end
