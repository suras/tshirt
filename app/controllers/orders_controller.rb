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


	def new_checkout


	end


	def save_item
       if(session[:image_id].present?)
       	 item_delete = UserItem.delete_all(:id => session[:image_ids])
         session[:image_ids] = ""
       end
         item = current_user.user_items.create(:image => params[0][:image], :image1 => params[1][:image] )
          img_id  = item.id
          session[:image_id] = img_id
	end
end
