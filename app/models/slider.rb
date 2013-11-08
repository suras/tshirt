class Slider < ActiveRecord::Base
  attr_accessible :image, :name, :status, :image_cache
  mount_uploader :image, ImageUploader
end
