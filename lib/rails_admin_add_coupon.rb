require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminAddCoupon
end
 
module RailsAdmin
  module Config
    module Actions
      class AddCoupon< RailsAdmin::Config::Actions::Base

        register_instance_option :link_icon do
          'icon-ok-sign'
        end

        register_instance_option :collection do
          true
        end

        register_instance_option :http_methods do
          [:post,:get, :xhr]
        end
        
        register_instance_option :pjax? do
          false
        end
        
        register_instance_option :controller do
          Proc.new do 
            nos = params[:nos].to_i
            if(nos > 0 && nos < 501)  
                
                nos.times do |n|
                  code = rand(5999999)
                 Coupon.create(:code => code)
                 

                end
              flash[:notice] = t(:coupon_generate_success)  
            else
               #flash[:notice] = "Please Enter a numeric value less than 500"
                flash[:notice] = t(:coupon_generate_error)
            end
          end  
        end
      end
    end
  end
end