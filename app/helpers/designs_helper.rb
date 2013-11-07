module DesignsHelper
	def get_categories()
    first = true
    output = ""
    categories = DesignCategory.all
    categories.each do |category|
      if first
        first = false
        output << link_to(category.name, design_category_path(:category_id => category.id), :remote => true,:class=>"current")
      else
        output << link_to(category.name, design_category_path(:category_id => category.id), :remote => true)
      end
    end
    return output.html_safe

  end


  def get_default_category_images()
    return " " unless DesignCategory.first.present?
    design_category = DesignCategory.first
    design_images = design_category.designs
    images = generate_image_links(design_images)


  end


  def get_product_categories()
    output = ""
    product_categories = Category.all
    product_categories.each do |category|
      output << link_to(category.name, category_path(:id => category.id), :remote => true)
    end
    return output.html_safe

  end


  def get_default_product_category_images()
    return " " unless Category.first.present?
    product_category = Category.first
    product_images = product_category.products
    images = generate_product_image_links(product_images)
  end



  def get_my_images()
    my_images = current_user.images
    images = generate_image_links(my_images)
  end

  

  def generate_product_image_links(images) 
    img_src = ""
    images.each do |design_image|
      img_src << "<img id=#{design_image.id} src="+design_image.image.url+ "/>"
    end
    img_src.html_safe
    
  end



  def generate_image_links(images) 
    img_src = ""
    images.each do |design_image|
      img_src << "<img src="+design_image.image.url+ "/>"
    end
    img_src.html_safe
    
  end



end
