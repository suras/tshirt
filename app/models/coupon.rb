class Coupon < ActiveRecord::Base
  attr_accessible :code, :status, :valid_to, :discount
end
