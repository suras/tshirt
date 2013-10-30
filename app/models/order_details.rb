class OrderDetails < ActiveRecord::Base
  attr_accessible :material, :notes, :order_id, :user_item_id, :quantity, :size, :per_product_price,
                  :shipping_address, :shipping_country, :shipping_state, :shipping_city, :shipping_zip_code, :contact_number
  belongs_to :order
  belongs_to :user_item_id
end


