class Appointments < ActiveRecord::Base
  attr_accessible :date, :meet_with, :acc_type, :username
end
