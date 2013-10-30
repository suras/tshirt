class Order < ActiveRecord::Base
  attr_accessible :amount, :currency, :payment_status,  :user_id, :user_item_id
  has_many :order_details
  belongs_to :user
  
end
