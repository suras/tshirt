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
				format.html { render :action => "new_contact"}
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

	def legal_terms
	end
end
