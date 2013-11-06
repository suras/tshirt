class DesignsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @default_image = Product.first.try(:image).try(:url)


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



  def save_user_images
    #@image = Image.create(:image => params[:image])
    @image = current_user.images.new(:image => params[:image])
    respond_to do |format|
      if(@image.save)
        
        format.js {render :text => @image.image.url}

        else
         format.js {render :text => "Error Uploading"}
      end
    end
  end

end
