class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone, :status
end