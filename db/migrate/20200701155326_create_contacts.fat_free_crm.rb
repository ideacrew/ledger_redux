# frozen_string_literal: true
# This migration comes from fat_free_crm (originally 20200502231418)
# This migration comes from fat_free_crm (originally 20100928030607)

class CreateContacts < ActiveRecord::Migration[4.2]
  def self.up
    create_table :fat_free_crm_contacts do |t|
      t.string :uuid, limit: 36
      t.references :user
      t.references :lead
      t.integer :assigned_to
      t.integer :reports_to
      t.string :first_name,  limit: 64, null: false, default: ""
      t.string :last_name,   limit: 64, null: false, default: ""
      t.string :access,      limit: 8, default: "Public"
      t.string :title,       limit: 64
      t.string :department,  limit: 64
      t.string :source,      limit: 32
      t.string :email,       limit: 64
      t.string :alt_email,   limit: 64
      t.string :phone,       limit: 32
      t.string :mobile,      limit: 32
      t.string :fax,         limit: 32
      t.string :blog,        limit: 128
      t.string :linkedin,    limit: 128
      t.string :facebook,    limit: 128
      t.string :twitter,     limit: 128
      t.string :address
      t.date :born_on
      t.boolean :do_not_call, null: false, default: false
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :fat_free_crm_contacts, %i[user_id last_name deleted_at], unique: true, name: 'id_last_name_deleted'
    add_index :fat_free_crm_contacts, :assigned_to
  end

  def self.down
    drop_table :fat_free_crm_contacts
  end
end
