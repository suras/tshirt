class Image < ActiveRecord::Base
  attr_accessible :image, :status, :thing_id, :thing_type,  :image_cache
  mount_uploader :image, ImageUploader
  belongs_to :thing, :polymorphic => true
  
end
