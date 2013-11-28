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
    @shipping = session[:shipping]
    @tax = session[:tax]
    @payment_amount = session[:payment_amount]
    @total = session[:total]

	end


	def save_item
       if(session[:image_id].present?)
       	 @user_item = UserItem.find(session[:image_id])
         if(params[:design].present? && params[:image].present?)
           @user_item.update_attributes(:design => params[:design], :image => params[:image],:color => params[:color], :title => params[:title], :design_notes => params[:design_notes])
         else
           @user_item.update_attributes(:design1 => params[:design1] , :image1 => params[:image1],:color1 => params[:color1], :title => params[:title], :design_notes => params[:design_notes] )
         end 

         img_id  = @user_item.id
       else
         item = current_user.user_items.create(:design => params[:design], :design1 => params[:design1],:color1 => params[:color1], :image => params[:image], :image1 => params[:image1], :title => params[:title], :design_notes => params[:design_notes], :color => params[:color])
          img_id  = item.id
          session[:image_id] = img_id
          @user_item = item
       end
        respond_to do |format|
          format.json {render :json => {:img_id=>img_id, :img_url =>@user_item.image.url}}
          format.js {render :json => {:img_id=>img_id, :img_url =>@user_item.image.url}}

        end
	end

  def  get_design
      @design = UserItem.find(params[:id])
      respond_to do |format|
        format.json {render :json => {
              :design => @design.design, 
              :design1 => @design.design1, 
              :color => @design.color, 
              :color1 => @design.color1,
              :design_notes => @design.design_notes,
              :title => @design.title
            } 
        }      
      end
  end
end
