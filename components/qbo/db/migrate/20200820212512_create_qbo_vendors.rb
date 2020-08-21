class CreateQboVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :qbo_vendors do |t|
      t.string :GivenName
      t.string :DisplayName
      t.string :FamilyName
      t.string :Id
      t.string :SyncToken
      t.string :domain
      t.string :AcctNum
      t.string :CompanyName
      t.string :PrintOnCheckName

      t.boolean :Vendor1099
      t.boolean :Active
      t.boolean :sparse

      t.float :Balance

      t.jsonb :BillAddr
      t.jsonb :WebAddr
      t.jsonb :PrimaryEmailAddr
      t.jsonb :PrimaryPhone
      t.jsonb :MetaData

      t.timestamps
    end
  end
end
