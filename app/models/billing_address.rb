class BillingAddress < ActiveRecord::Base
  attr_accessible :address2, :city, :company, :country, :first_name, :is_active, :last_name, :phone, :postal_code, :state, :user_id
  belongs_to :user
end
