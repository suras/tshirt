class Shipping < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :contact_number, :country, :first_name, :last_name, :postal_code, :state
end
