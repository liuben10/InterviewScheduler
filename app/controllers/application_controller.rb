require "cgi"

class ApplicationController < ActionController::Base
  #protect_from_forgery

  protected
    def authorize (currentUser, userType)
      userid = session[:authenticated_user]
      Rails.logger.debug ";;;;;;;;;;;;;;;;;"
      Rails.logger.debug session
      Rails.logger.debug ";;;;;;;;;;;;;;;;;"
      if not Candidate.find_by_username(userid).nil?
        type = :candidate
      else
        type = :recruiter
      end
      if userid.nil? or userid != currentUser or type != userType
        if type == :candidate
          redirect_to candidate_path(userid)
        else
          redirect_to recruiter_path(userid)
        end
      end
    end


  def message(recruiter, candidate, message)
    @recruiter = Recruiter.find_by_username(recruiter)
    @candidate = Candidate.find_by_username(candidate)
    @message = CGI::escapeHTML(message)
    if @candidate
      UserMailer.recruiter_send(@recruiter, @candidate, @message)
                .deliver
      flash[:notice] = "Message successfully sent!"
    else
      flash[:error] = "Invalid candidate name specified."
    end
  end
end
