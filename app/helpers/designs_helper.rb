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
       design_category = DesignCategory.first
       design_images = design_category.designs
       images = generate_image_links(design_images)


	end


	def generate_image_links(design_images) 
    img_src = ""
    design_images.each do |design_image|
      img_src << "<img src="+design_image.image.url+ "/>"
    end
    img_src.html_safe
    
  end
end
