class Design < ActiveRecord::Base
  attr_accessible :description, :image,:remove_image, :name, :status, :image_cache, :design_category_id
   mount_uploader :image, ImageUploader
   belongs_to :design_category
end
