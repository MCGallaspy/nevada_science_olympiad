class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
    add_index :announcements, :created_at
  end
end
