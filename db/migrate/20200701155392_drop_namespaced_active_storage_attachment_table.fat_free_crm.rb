# This migration comes from fat_free_crm (originally 20200515170642)
class DropNamespacedActiveStorageAttachmentTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :fat_free_crm_active_storage_attachments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
