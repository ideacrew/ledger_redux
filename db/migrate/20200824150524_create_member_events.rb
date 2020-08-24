class CreateMemberEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :member_events do |t|
      t.string :type, null: false
      
      t.text :data, null: false
      t.text :metadata, null: false
      t.datetime :created_at, null: false
      t.integer :member_id

      t.index :member_id
    end
  end
end
