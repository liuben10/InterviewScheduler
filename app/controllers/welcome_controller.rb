class WelcomeController < ApplicationController
  def index
    @candidate = Candidate.new
    if not session[:authenticated_user].nil?
      candidate = Candidate.find_by_name(session[:authenticated_user])
      recruiter = Recruiter.find_by_name(session[:authenticated_user])
      if not candidate.nil?
        redirect_to candidate_path(candidate.name)
      elsif not recruiter.nil?
        redirect_to recruiter_path(recruiter.name)
      end
    end
  end

  def show
    Rails.logger.debug params[:userid]
    foundUser = Recruiter.find_by_email(params[:userid])
    if not foundUser.nil?
      redirectPath = recruiter_path(foundUser.name)
    else
      foundUser = Candidate.find_by_email(params[:userid])
      if not foundUser.nil?
        redirectPath = candidate_path(foundUser.name)
      else
        flash[:notice] = "Email not found"
        redirect_to welcome_index_path and return
      end
    end
    if foundUser.password != params[:passid]
      flash[:notice] = "Password was incorrect, please try again"
      redirect_to welcome_index_path and return
    else
      session[:authenticated_user] = foundUser.name
    end
    redirect_to redirectPath
  end

  def logout
    session[:authenticated_user] = nil
    redirect_to welcome_index_path
  end

end
