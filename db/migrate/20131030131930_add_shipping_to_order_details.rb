class AddShippingToOrderDetails < ActiveRecord::Migration
  def change
    add_column :order_details, :shipping_address, :string
    add_column :order_details, :shipping_country, :string
    add_column :order_details, :shipping_state, :string
    add_column :order_details, :shipping_city, :string
    add_column :order_details, :shipping_zip_code, :string
    add_column :order_details, :contact_number, :string
  end
end
