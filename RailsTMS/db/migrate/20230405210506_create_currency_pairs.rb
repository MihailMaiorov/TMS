class CreateCurrencyPairs < ActiveRecord::Migration[7.0]
  def change
    create_table :currency_pairs do |t|
      t.string :pair, index: true
      t.decimal :rate

      t.timestamps
    end
  end
end
