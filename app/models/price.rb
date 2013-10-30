class Price < ActiveRecord::Base
  attr_accessible :amount, :currency, :product_id
  belongs_to :product
end
