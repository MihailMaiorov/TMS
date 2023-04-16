class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :message
      t.integer :customer_id
      t.integer :book_id
      t.index %i[customer_id book_id], unique: true

      t.timestamps
    end
  end
end
