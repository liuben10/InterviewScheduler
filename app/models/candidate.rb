class Candidate < ActiveRecord::Base

  attr_accessible :email, :name, :username, :password, :phone
  has_and_belongs_to_many :recruiters

end
