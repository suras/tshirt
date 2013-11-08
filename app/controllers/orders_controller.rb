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
       	 @user_item = UserItem.find(session[:image_id])
         if(params[:design].present? && params[:image].present?)
           @user_item.update_attributes(:design => params[:design],:image => params[:image])
         else
           @user_item.update_attributes(:design1 => params[:design1] , :image1 => params[:image1] )
         end 
         img_id  = @user_item.id
       else
         item = current_user.user_items.create(:design => params[:design], :design1 => params[:design1] ,:image => params[:image], :image1 => params[:image1] )
          img_id  = item.id
          session[:image_id] = img_id
       end
        respond_to do |format|
          format.json {render :json => {:img_id=>img_id}}
          format.js {render :json => {:img_id=>img_id}}

        end
	end


end
