class Candidate < ActiveRecord::Base
  attr_accessible :email, :name, :username, :password, :phone, :attach, :pic
  has_and_belongs_to_many :recruiters

  has_attached_file :pic,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :path => ":rails_root/public/system/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  has_attached_file :attach,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

end
