class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year_published
      t.string :isbn
      t.decimal :price
      t.boolean :out_of_print
      t.integer :views
      t.references :supplier, index: true, foriegn_key: true
      t.references :author, index: true, foriegn_key: true

      t.timestamps
    end
  end
end
