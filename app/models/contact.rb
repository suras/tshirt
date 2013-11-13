class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone, :status
  validates :name, :presence => true
  validates :message, :presence => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "is invalid"
end
