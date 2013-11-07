class Recruiter < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :password, :company
end
