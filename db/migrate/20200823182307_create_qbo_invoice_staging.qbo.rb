# This migration comes from qbo (originally 20200820212512)
class CreateQboInvoiceStaging < ActiveRecord::Migration[6.0]
  def change
    create_table :qbo_invoice_staging do |t|
      t.string :sub_customer_last_name
      t.string :sub_customer_external_id
      t.string :customer_external_id
      t.string :plan_name
      t.string :coverage_type

      t.float :premium_amount

      t.date :benefit_begin_date

      t.timestamps
    end
  end
end
