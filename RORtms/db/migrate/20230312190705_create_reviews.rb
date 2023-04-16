class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :rating
      t.integer :state
      t.references :customer, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
