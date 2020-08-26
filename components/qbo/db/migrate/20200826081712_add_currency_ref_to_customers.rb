class AddCurrencyRefToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :qbo_customers, :CurrencyRef, :jsonb

  end
end
