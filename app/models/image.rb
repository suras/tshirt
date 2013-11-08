class Image < ActiveRecord::Base
  attr_accessible :image, :status, :thing_id, :thing_type,  :image_cache, :remove_image
  mount_uploader :image, ImageUploader
  belongs_to :thing, :polymorphic => true
  belongs_to :user
  belongs_to :product
  
end
