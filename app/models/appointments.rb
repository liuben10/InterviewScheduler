class Appointments < ActiveRecord::Base
  attr_accessible :date, :meet_with, :type, :username
end
