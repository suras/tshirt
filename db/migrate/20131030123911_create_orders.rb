class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :amount
      t.integer :currency
      t.string :payment_status
      t.integer :user_item_id

      t.timestamps
    end
  end
end
