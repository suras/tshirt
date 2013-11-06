module DesignsHelper
	def get_categories()
        output = ""
		categories = DesignCategory.all
		categories.each do |category|
        output << link_to(category.name, category_path(:category_id => category.id), :remote => true)
        end
        return output.html_safe
		
	end


	def get_category()
		return " " unless DesignCategory.first.present?
       design_category = DesignCategory.first
       design_images = design_category.designs
       images = generate_image_links(design_images)


	end



	def get_my_images()
		my_images = current_user.images
       images = generate_image_links(my_images)
   end


	def generate_image_links(images) 
    img_src = ""
    images.each do |design_image|
      img_src << "<img src="+design_image.image.url+ "/>"
    end
    img_src.html_safe
    
  end



end
