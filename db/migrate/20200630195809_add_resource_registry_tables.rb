class AddResourceRegistryTables < ActiveRecord::Migration[6.0]
  def change
    
    create_table :resource_registry_features do |t|
      t.string  :key
      t.text    :namespace, array:true
      t.boolean :is_enabled
      t.text    :item
    end

    create_table :resource_registry_settings do |t|
      t.string :key
      t.text   :options, array:true
      t.text   :item
      t.bigint :feature_id
    end

    add_index :resource_registry_settings, :feature_id

    create_table :resource_registry_meta do |t|
      t.string  :label
      t.string  :content_type
      t.text    :default
      t.text    :value
      t.text    :description
      t.text    :enum, array: true
      t.boolean :is_required
      t.boolean :is_visible
      t.references :editable, polymorphic: true
    end
  end
end
