class ShippingAddress < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :company, :country, :first_name, :is_active, :last_name, :phone, :postal_code, :state, :user_id
  belongs_to :user
end
