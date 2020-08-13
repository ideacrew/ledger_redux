class CreateQuickbooksCredentials < ActiveRecord::Migration[6.0]
  def change
    create_table :quickbooks_credentials do |t|
      t.string :realm_id
      t.string :client_id
      t.string :client_secret
      t.string :refresh_token
      t.string :access_token

      t.timestamps
    end
  end
end
