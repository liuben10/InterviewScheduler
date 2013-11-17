class Recruiter < ActiveRecord::Base
  
  has_and_belongs_to_many :candidates
  
  attr_accessible :email, :name, :phone, :password, :company
end
