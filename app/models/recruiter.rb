class Recruiter < ActiveRecord::Base  
 
  attr_accessible :email, :name, :phone, :password, :company, :username, :attach, :pic

  has_and_belongs_to_many :candidates

  has_attached_file :pic,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_path => ":rails_root/public/system/:class/:attachment/:id/:style/no-pic.jpg",
    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
    :default_url => "/system/no-pic.jpg",
    :url => "/system/:class/:attachment/:id/:style/:filename"

  has_attached_file :attach,
  	:default_path => ":rails_root/public/system/:class/:attachment/:id/:style/no-attach.jpg",
    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
    :default_url => "/system/no-attach.png",
    :url => "/system/:class/:attachment/:id/:style/:filename"

end
