class HomeController < ApplicationController
	before_filter :authenticate_user! , :only => [:user_settings]
	def index
		@sliders = Slider.where(:status => true)
	end
	
	def sign_in
	end
	
	def new_contact
		@contact = Contact.new  
	end
	
	def create_contact
		@contact = Contact.new(params[:contact])
		respond_to do |format|
			if(UserMailer.contact_email(params[:contact]).deliver  && @contact.save)
				format.html {redirect_to(contact_path(), :notice => "Message sent successfully")}   
			else
				format.html {redirect_to(contact_path(), :notice => "Please fill in all fields with valid values and submit")}   
				#format.html { render :action => "new_contact", :notice => "Please fill all fields and send"}
			end
		end
	end
	
	def about_us
	end
	
	def partners
	end

	def terms_and_conditions
	end
	
	def how_to_design
	end

	def how
	end

	def legal_terms
	end

	def create_billing
		current_user.create_billing_address(params[:billing_address])   
		redirect_to user_setting_path()
	end
	def create_shipping
		current_user.create_shipping_address(params[:shipping_address])   
		redirect_to user_setting_path()
	end

	def save_user
		current_user.update_attributes(:email => params[:user][:email],:first_name => params[:user][:first_name],:last_name => params[:user][:last_name],:mobile => params[:user][:mobile])   
		redirect_to user_setting_path()
	end
	def delete_user_product
		@user_items = UserItem.find_by_id(params[:id]).delete()
		redirect_to user_setting_path()
	end
	def change_password
		current_user.update_attributes(:password => params[:user][:password],:password_confirmation => params[:user][:password_confirmation])   
		if(params[:user][:password].present?)
			redirect_to new_user_session_path, :notice => "Please login with changed password"
		else
			redirect_to user_setting_path()
		end
	end


	def email_avail
		if User.exists?(:email=>params[:email])
			msg = "Email not available"
		else
			msg = ""
		end
		respond_to do |format|
			format.json {render :json => {:msg => msg}}
			format.js
			format.html
		end
	end
	def user_settings
		@user = current_user
		@billing = @user.billing_address.present? ? @user.billing_address : @user.build_billing_address
		@shipping = @user.shipping_address.present? ? @user.shipping_address : @user.build_shipping_address
		@category = Category.all
		@user_items = @user.user_items
		# if(params[:category_id].present?)
		# 	@products = Product.where(:category_id => params[:category_id])
		# else
		# 	@products = Product.all
		# end
		respond_to do |format|
			format.json {render :json => {:products => @products}}
			format.js
			format.html
		end
	end
end
