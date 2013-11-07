class Candidate < ActiveRecord::Base

  attr_accessible :email, :name, :username, :password, :phone

  def self.add_candidate(candidate)
    if candidate[:username] != "" and candidate[:password] != "" then
      Candidate.create(candidate)
      return true
    else
      return false
    end
  end
end
