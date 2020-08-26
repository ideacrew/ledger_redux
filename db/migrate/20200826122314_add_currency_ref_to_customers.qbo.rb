# This migration comes from qbo (originally 20200826081712)
class AddCurrencyRefToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :qbo_customers, :CurrencyRef, :jsonb

  end
end
