class UserItem < ActiveRecord::Base
  attr_accessible  :design, :design1, :image, :image1, :image_cache, :image1_cache, :product_id, :title, :user_id
  belongs_to :user
  belongs_to :product
  has_many :orders
  mount_uploader :image, ImageUploader
  mount_uploader :image1, ImageUploader
end
