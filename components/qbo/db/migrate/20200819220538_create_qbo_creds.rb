class CreateQboCreds < ActiveRecord::Migration[6.0]
  def change
    create_table :qbo_quickbook_credentials do |t|
      t.string :realm_id
      t.string :client_id
      t.string :client_secret
      t.string :refresh_token
      t.string :access_token
      t.timestamps
    end
  end
end
