class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.string :size
      t.string :material
      t.text :notes
      t.integer :user_item_id
      t.string :per_product_price

      t.timestamps
    end
  end
end
