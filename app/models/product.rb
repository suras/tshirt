class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :image, :name, :status
  belongs_to :category
  has_one :price
  has_many :product_attributes
  mount_uploader :image, ImageUploader
end
