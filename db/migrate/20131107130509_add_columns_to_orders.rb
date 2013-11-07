class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cart_subtotal, :integer
    add_column :orders, :shipping_and_handling, :integer
    add_column :orders, :tax, :string
    add_column :orders, :order_total, :string
  end
end
