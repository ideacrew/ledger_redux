# This migration comes from qbo (originally 20200826081712)
class AddCurrencyRefAndLevelToSubCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :qbo_sub_customers, :Level, :integer
    add_column :qbo_sub_customers, :CurrencyRef, :jsonb
  end
end
