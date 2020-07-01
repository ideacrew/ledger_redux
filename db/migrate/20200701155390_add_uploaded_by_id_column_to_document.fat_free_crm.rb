# This migration comes from fat_free_crm (originally 20200504142338)
class AddUploadedByIdColumnToDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :fat_free_crm_documents, :uploaded_by_id, :string
  end
end
