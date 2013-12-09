require "cgi"

class ApplicationController < ActionController::Base
  #protect_from_forgery

  protected
    def authorize (currentUser, userType)
      userid = session[:authenticated_user]
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

  def candidateMessageRecruiter(candidate_id, recruiter_id, message)
    if not candidate_id.nil?
      message(recruiter_id, candidate_id, message, "candidate")
    end
  end

  def sendMessageFromRecruiter(params, startDate, endDate)
    messageToSend = ""
    messageToSend += "Recruiter " + params[:recruiter_id]
    messageToSend += " has invited you to an event on " +  startDate.strftime("%FT%T%:z")
    messageToSend += " and ending on " + endDate.strftime("%FT%T%:z") + " and description: " + params[:description]
    message(params[:recruiter_id], params[:pending_id], messageToSend)
  end

  def fieldIsEmpty(field)
    return ((field.strip.nil?) or field.nil? or field.empty?)
  end


  def message(recruiter, candidate, message, type="recruiter")
    @recruiter = Recruiter.find_by_username(recruiter)
    @candidate = Candidate.find_by_username(candidate)
    @message = CGI::escapeHTML(message)
    if @candidate
      if type == "candidate"
        UserMailer.candidate_send(@recruiter, @candidate, @message)
      else
        UserMailer.recruiter_send(@recruiter, @candidate, @message)
                .deliver
      end
      flash[:notice] = "Message successfully sent!"
    else
      flash[:error] = "Invalid candidate name specified."
    end
  end
end
