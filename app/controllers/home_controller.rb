class HomeController < ApplicationController
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

	def user_settings
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
end
