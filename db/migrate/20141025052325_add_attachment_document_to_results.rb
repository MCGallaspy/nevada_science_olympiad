class AddAttachmentDocumentToResults < ActiveRecord::Migration
  def self.up
    change_table :results do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :results, :document
  end
end
