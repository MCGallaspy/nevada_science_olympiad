class AddContentToResult < ActiveRecord::Migration
  def change
    add_column :results, :content, :text
  end
end
