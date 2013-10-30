class UserItem < ActiveRecord::Base
  attr_accessible  :design, :image, :product_id, :title, :user_id
  belongs_to :user
  belongs_to :product
  has_many :orders
end
