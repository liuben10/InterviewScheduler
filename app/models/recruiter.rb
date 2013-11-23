class Recruiter < ActiveRecord::Base  
 
  attr_accessible :email, :name, :phone, :password, :company, :username, :attach, :pic

  has_and_belongs_to_many :candidates

  has_attached_file :pic,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
    :url => "/system/:class/:attachment/:id/:style/:filename"

  has_attached_file :attach,
    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
    :url => "/system/:class/:attachment/:id/:style/:filename"

end
