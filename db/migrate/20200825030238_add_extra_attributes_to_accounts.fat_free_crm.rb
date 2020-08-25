# This migration comes from fat_free_crm (originally 20200824173112)
class AddExtraAttributesToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :fat_free_crm_accounts, :hbx_id, :string
    add_column :fat_free_crm_accounts, :fein, :string
  end
end