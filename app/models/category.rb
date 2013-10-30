class Category < ActiveRecord::Base
  attr_accessible :description, :image, :name, :status
  has_many :products
  mount_uploader :image, ImageUploader
end
