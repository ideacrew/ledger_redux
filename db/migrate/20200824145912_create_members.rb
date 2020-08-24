class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.date :effective_date
      t.string :coverage_kind
      t.string :subscriber_id
      t.string :total_premium
      t.text :payload

      t.timestamps
    end
  end
end
