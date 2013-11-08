class WelcomeController < ApplicationController
  def index
    @candidate = Candidate.new
    sess_id = request.session_options[:id].to_i
    if ((not session[:authenticated_users].nil?) and (not session[:authenticated_users][sess_id].nil?))
      sessname = session[:authenticated_users][sess_id]
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
        redirect_to recruiter_path(foundRecruiter.name)
      end
    elsif not foundCandidate.nil?
      if foundCandidate.password != password
        flash[:notice] = "Password was incorrect, please try again"
        redirect_to welcome_index_path
      else
        #redirect_to candidate_show_path
        redirect_to candidate_path(foundCandidate.name)
      end
    else
      flash[:notice] = "User #{username} was not found"
      redirect_to welcome_index_path
    end
  end
  
  
  
end
