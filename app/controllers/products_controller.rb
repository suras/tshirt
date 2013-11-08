class ProductsController < ApplicationController
	before_filter :authenticate_user!
	def products
    @category = Category.all
    if(params[:category_id].present?)
        @products = Product.where(:category_id => params[:category_id])
    else
        @products = Product.all
    end
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
      @output_price = 0
      session[:total] = ""
      session[:tax] = ""
      session[:shipping] = ""
      session[:payment_amount] = ""
      # @attribute = @product.attributes.where(:id => params[:attribute_id])
      # @output_price = (@attribute.price * params[:quantity].to_i)
      params[:attributes].each do |k, v|
        attribute = @product.product_attributes.where(:id => k).first
        @output_price += (attribute.price.to_i * v.to_i)
      end
      session[:total] = @output_price

      tax =  @product.tax.to_i
      tax = tax.to_f/100
      @output_price = @output_price + (@output_price*tax)
       @output_price = @output_price + @product.try(:shipping_and_handling).to_i
      if(params[:coupon_code].present?)
          coupon = Coupon.find_by_code(params[:coupon_code])
          coupon_discount = coupon.discount.to_i
          coupon_discount = @output_price - coupon_discount
          @output_price = @output_price * coupon_discount 
      end
      session[:tax] = @product.tax
      session[:shipping] = @product.try(:shipping_and_handling)
      session[:payment_amount] = @output_price

      respond_to do |format|
         format.json {render :json => {:price => @output_price}}
      end
	end 
end
