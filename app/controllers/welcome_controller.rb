class WelcomeController < ApplicationController
  def index
    @candidate = Candidate.new
  end

  def show
    username = params[:userid]
    Rails.logger.debug username
    password = params[:passid]
    foundRecruiter = Recruiter.find_by_email(username)
    foundCandidate = Candidate.find_by_email(username)
    if not foundRecruiter.nil?
      if foundRecruiter.password != password
        flash[:notice] = "Password was incorrect, please try again"
        redirect_to welcome_index_path
      else
        #redirect_to recruiter_show_path
        redirect_to recruiter_path(params[:userid])
      end
    elsif not foundCandidate.nil?
      if foundCandidate.password != password
        flash[:notice] = "Password was incorrect, please try again"
        redirect_to welcome_index_path
      else
        #redirect_to candidate_show_path
        redirect_to candidate_path(params[:userid])
      end
    else
      flash[:notice] = "User #{username} was not found"
      redirect_to welcome_index_path
    end
  end
  
end
