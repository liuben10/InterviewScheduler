class ApplicationController < ActionController::Base
  protect_from_forgery
    
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
    
end
