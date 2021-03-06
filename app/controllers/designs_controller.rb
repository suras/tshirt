class DesignsController < ApplicationController
  before_filter :authenticate_user!
  def index
    session[:image_id] = nil
    if(params[:product_id].present?)
      @product = Product.find(params[:product_id])
      @default_image = @product.try(:image).try(:url)
      @back_image = @product.try(:second_image).try(:url)
      @attributes = @product.product_attributes
    else
      @product = Product.first
      @default_image = @product.try(:image).try(:url)
      @attributes = @product.product_attributes

    end
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
        format.json {render :json => {:status=>"success", :url=>@image.image.url}  }
        #format.json {render :json => @image.image.url}
      else
        format.json {render :text => "Error Uploading"}
      end
    end
  end
  


end
