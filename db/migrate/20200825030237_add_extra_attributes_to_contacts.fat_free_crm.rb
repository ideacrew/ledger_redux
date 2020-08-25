# This migration comes from fat_free_crm (originally 20200824173012)
class AddExtraAttributesToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :fat_free_crm_contacts, :hbx_id, :string
    add_column :fat_free_crm_contacts, :hired_on, :date
    add_column :fat_free_crm_contacts, :ssn, :string
  end
end
