class OrdersController < ApplicationController
before_filter :authenticate_user!

	def create_order

		order = Order.new(:user_id=> current_user, :user_item_id => session[:user_item_id])
        order.save

        session[:order_id]= order.id
        session[:user_item_id] = ""

	end


	def create_order_details
		order = Order.find(session[:user_id])
        details = order.order_details.new
        product = Product.find(params[:product_id])
        
        session[:order_id] = ""
	end
end
