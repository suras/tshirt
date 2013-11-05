class ProductAttribute < ActiveRecord::Base
  attr_accessible :attribute_name, :currency, :price, :product_id, :status
  belongs_to :product
end
