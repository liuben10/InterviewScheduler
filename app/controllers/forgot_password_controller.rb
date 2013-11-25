class ForgottenPassword < ApplicationController

require 'securerandom'

attr_accessible :user_email
def reset_password(user_email)
  #Check to see if they are a valid user and what kind they are
  # Get a userid for the email address then check to see if the information is nil
  type = ""
  user = ""
  if not Recruiter.find_by_email(user_email).nil?
     type = "recruiter"
     user = Recruiter.find_by_email(user_email).user.to_s
  if not Candidate.find_by_email(user_email).nil?
      type = "candidate"
      user = Candidate.find_by_email(user_email).user
  else
    flash[:notice] = "No user associated with this email address: #{user_email} "
        redirect_to welcome_index_path and return
  end
    newPass = make_new_password(user, type)
    message = "Hello #{user}, \n Your password for InterviewScheduler has been reset to: #{newPass} \n 
      Please login with the above temporary password and edit your user information to another password."
    UserMailer.forgot_password(user_email, message).deliver

   flash[:notice] = "You have been been emailed a temporary password at #{user_email}"
  end
end

def make_new_password(user, type)
    newPass = SecureRandom.base64()
    user.password = newPass
    user.save!
    return newPass
