class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :image, :name, :status
  belongs_to :category
  mount_uploader :image, ImageUploader
end
