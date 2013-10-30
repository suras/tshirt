class Order < ActiveRecord::Base
  attr_accessible :amount, :currency, :payment_status,  :user_id, :user_item_id
  belongs_to :user
  has_many :order_details
  #has_many :jobs, :foreign_key => 'user_id', :class_name => "Task"
  
end
