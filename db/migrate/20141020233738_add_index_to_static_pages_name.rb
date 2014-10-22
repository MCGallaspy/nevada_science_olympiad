class AddIndexToStaticPagesName < ActiveRecord::Migration
  def change
    add_index :static_pages, :name, unique: true
  end
end
