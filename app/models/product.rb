class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :image, :name, :status, :image_cache, :product_attributes_attributes, :price_attributes, :images_attributes, :remove_image
  belongs_to :category
  has_one :price
  has_many :images, :as => :thing
  has_many :product_attributes
  accepts_nested_attributes_for :product_attributes
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :price
  mount_uploader :image, ImageUploader
end
