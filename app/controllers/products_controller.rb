class ProductsController < ApplicationController
	def products
        @products = Product.where(:category_id => params[:category_id])
        respond_to do |format|
         format.json {render :json => {:products => @products}}
         format.js
         format.html
        end
	end

	def get_product
        @product = Product.where(:id => params[:id])
        @attributes = @product.product_attributes
        respond_to do |format|
         format.json {render :json => {:product => @product, :attribute => @attributes, :image_url => @product.image.url}}
         format.js
        end

	end


	def calculation
      @product = Product.find(params[:product_id])
      @attribute = @product.attributes.where(:id => params[:attribute_id])
      @output_price = (@attribute.price * params[:quantity].to_i)
      respond_to do |format|
         format.json {render :json => {:price => @output_price}}
      end
	end 
end
