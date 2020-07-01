# frozen_string_literal: true
# This migration comes from fat_free_crm (originally 20200502231471)
# This migration comes from fat_free_crm (originally 20141230205455)

# This migration comes from acts_as_taggable_on_engine (originally 4)
class AddMissingTaggableIndex < ActiveRecord::Migration[4.2]
  def self.up
    #add_index :fat_free_crm_taggings, %i[taggable_id taggable_type context], name: 'taggings_id_type_context'
  end

  def self.down
    remove_index :fat_free_crm_taggings, name: 'taggings_id_type_context'
  end
end
