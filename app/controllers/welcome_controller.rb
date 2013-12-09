class WelcomeController < ApplicationController

  def index
    @candidate = Candidate.new
    if not session[:authenticated_user].nil?
      sessname = session[:authenticated_user]
      candidate = Candidate.find_by_username(sessname)
      recruiter = Recruiter.find_by_username(sessname)
      if not candidate.nil?
        redirect_to candidate_path(candidate.username)
      elsif not recruiter.nil?
        redirect_to recruiter_path(recruiter.username)
      end
    end
  end

  def show
    Rails.logger.debug params[:userid]
    foundRecruiter = Recruiter.find_by_username(params[:userid])
    foundCandidate = Candidate.find_by_username(params[:userid])
    if not foundRecruiter.nil?
      foundUser = foundRecruiter
      #redirect_to recruiter_show_path
      redirectPath = recruiter_path(foundRecruiter.username)
    elsif not foundCandidate.nil?
      foundUser = foundCandidate
      #redirect_to candidate_show_path
      redirectPath = candidate_path(foundCandidate.username)
    else
      flash[:notice] = "Username not found"
      redirect_to welcome_index_path and return
    end
    if foundUser.password != params[:password]
      flash[:notice] = "Password was incorrect, please try again"
      redirect_to welcome_index_path and return
    else
      session[:authenticated_user] = foundUser.username
    end
    redirect_to redirectPath
  end

  def logout
    session[:authenticated_user] = nil
    redirect_to welcome_index_path
  end


  def reset_password
  #Check to see if they are a valid user and what kind they are
  # Get a userid for the email address then check to see if the information is nil
    user_email = params[:email]
    type = ""
    user = ""
    if not Recruiter.find_by_email(user_email).nil?
     type = "recruiter"
     user = Recruiter.find_by_email(user_email)
    elsif not Candidate.find_by_email(user_email).nil?
      type = "candidate"
      user = Candidate.find_by_email(user_email)
    else
      flash[:notice] = "No user associated with this email address: #{user_email} "
      redirect_to welcome_index_path and return
    end
    newPass = make_new_password(user, type)
    message = "Hello #{user.username}, \n Your password for InterviewScheduler has been reset to: #{newPass}
      Please login with the above temporary password and edit your user information to another password."
    UserMailer.forgot_password(user_email, message).deliver
    flash[:notice] = "You have been been emailed a temporary password at #{user_email}"
    redirect_to welcome_index_path
  end

  def make_new_password(user, type)
    newPass = SecureRandom.base64()
    user.password = newPass
    user.save!
    return newPass
  end

end
