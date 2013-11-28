class Billing < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :company, :country, :first_name, :last_name, :phone, :postal_code, :state
  belongs_to :order




end
