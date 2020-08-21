# This migration comes from qbo (originally 20200820212412)
class CreateQboSubCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :qbo_sub_customers do |t|
      t.string :PrimaryTaxIdentifier
      t.string :GivenName
      t.string :DisplayName
      t.string :FullyQualifiedName
      t.string :CompanyName
      t.string :FamilyName
      t.string :Id
      t.string :SyncToken
      t.string :domain
      t.string :PrintOnCheckName
      t.string :PreferredDeliveryMethod
      t.string :ParentRef
      t.float :BalanceWithJobs
      t.float :Balance

      t.boolean :BillWithParent
      t.boolean :sparse
      t.boolean :Active
      t.boolean :Job
      t.boolean :Taxable

      t.jsonb :BillAddr
      t.jsonb :PrimaryEmailAddr
      t.jsonb :PrimaryPhone
      t.jsonb :MetaData
 
      t.timestamps
    end
  end
end
