class DesignCategory < ActiveRecord::Base
  attr_accessible :description, :name, :status
  has_many :designs
end
