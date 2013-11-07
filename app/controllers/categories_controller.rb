class CategoriesController < ApplicationController
	before_filter :authenticate_user!
	def show
	    @product_category = Category.find(params[:id])
	    @product_images = @product_category.products
	    @images = self.generate_image_links(@product_images)
	    respond_to do |format|
	      format.js
	    end

	end

  def generate_image_links(images) 
    img_src = ""
    images.each do |design_image|
      img_src << "<img id=#{design_image.id} src="+design_image.image.url+ "/>"
    end
    img_src.html_safe
  end
end
