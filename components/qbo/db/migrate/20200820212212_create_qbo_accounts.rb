class CreateQboAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :qbo_accounts do |t|
      t.string :Name
      t.string :Id
      t.string :SyncToken
      t.string :AcctNum
      t.string :AccountType
      t.string :AccountSubType
      t.string :Description

      t.string :FullyQualifiedName
      t.string :domain
      t.string :Classification

      t.boolean :Active
      t.boolean :SubAccount
      t.boolean :sparse

      t.float :CurrentBalanceWithSubAccounts
      t.float :CurrentBalance
      
      t.jsonb :MetaData
      t.jsonb :CurrencyRef
      t.jsonb :ParentRef
      t.timestamps
    end
  end
end

