class AddIndexToJokes < ActiveRecord::Migration[7.0]
  def change
    add_index :jokes, :body
    add_index :jokes, :category_id, using: :hash
  end
end
