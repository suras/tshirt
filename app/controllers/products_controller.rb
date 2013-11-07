class ProductsController < ApplicationController
	def products
        @products = Product.where(:category_id => params[:category_id])
        respond_to do |format|
         format.json {render :json => {:products => @products}}
         format.js
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
end
