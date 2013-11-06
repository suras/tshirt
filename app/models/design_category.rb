class DesignCategory < ActiveRecord::Base
  attr_accessible :description, :name, :status, :designs_attributes
  has_many :designs
  accepts_nested_attributes_for :designs, :allow_destroy => true
  
end
