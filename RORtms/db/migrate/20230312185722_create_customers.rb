class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.integer :visits
      t.integer :orders_count
      t.integer :lock_version

      t.timestamps
    end
  end
end
