class AddAttachmentDocumentToForms < ActiveRecord::Migration
  def self.up
    change_table :forms do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :forms, :document
  end
end
