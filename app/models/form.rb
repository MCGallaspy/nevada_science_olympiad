class Form < ActiveRecord::Base
  has_attached_file :document
  validates_attachment :document, content_type: { :content_type => ["application/pdf", "application/excel"] }
  validates_attachment_presence :document
  default_scope -> { order('created_at DESC') }
end
