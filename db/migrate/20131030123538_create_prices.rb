class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :product_id
      t.integer :amount
      t.string :currency

      t.timestamps
    end
  end
end
