# This migration comes from fat_free_crm (originally 20200527212825)
class AddLonLatToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :fat_free_crm_addresses, :lonlat, :point, geographic: true
  end
end
