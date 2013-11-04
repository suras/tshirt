class Design < ActiveRecord::Base
  attr_accessible :description, :image, :name, :status
   mount_uploader :image, ImageUploader
   belongs_to :design_category
end
