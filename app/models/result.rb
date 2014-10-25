class Result < ActiveRecord::Base
  has_attached_file :document
  validates_attachment :document, content_type: { :content_type => ["application/pdf", "application/excel", "application/vnd.ms-excel"] }
  validates :content, presence: true, allow_blank: true
end
