class WelcomeController < ApplicationController
  def index
    @candidate = Candidate.new
    if not session[:authenticated_user].nil?
      sessname = session[:authenticated_user]
      candidate = Candidate.find_by_name(sessname)
      recruiter = Recruiter.find_by_name(sessname)
      if not candidate.nil?
        redirect_to candidate_path(candidate.name)
      elsif not recruiter.nil?
        redirect_to recruiter_path(recruiter.name)
      end
    end
  end

  def show
    Rails.logger.debug params[:userid]
    foundRecruiter = Recruiter.find_by_email(params[:userid])
    foundCandidate = Candidate.find_by_email(params[:userid])
    if not foundRecruiter.nil?
      foundUser = foundRecruiter
      #redirect_to recruiter_show_path
      redirectPath = recruiter_path(foundRecruiter.name)
    elsif not foundCandidate.nil?
      foundUser = foundCandidate
      #redirect_to candidate_show_path
      redirectPath = candidate_path(foundCandidate.name)
    else
      flash[:notice] = "Email not found"
      redirect_to welcome_index_path and return
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
