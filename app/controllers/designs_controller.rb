class DesignsController < ApplicationController
  def index


  end


  def category
    @design_category = DesignCategory.find(params[:category_id])
    @design_images = @design_category.designs
    @images = self.generate_image_links(@design_images)
    respond_to do |format|
      format.js

    end
  
  end

  def generate_image_links(design_images) 
    img_src = ""
    design_images.each do |design_image|
      img_src << "<img src="+design_image.image.url+ "/>"
    end
    img_src.html_safe
  end

end
