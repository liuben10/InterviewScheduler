class UsersController < ApplicationController

  def add_user(user, type)
    #type is a symbolized version of a class name
      debugmsg = "Malformed input, name, email, password, or company was empty"
      if validations(user[:name], user[:email], user[:password])
        flash[:notice] = debugmsg
        return false
      elsif not (Recruiter.find_by_email(user[:email]).nil? and Candidate.find_by_email(user[:email]).nil?)
        flash[:notice] = "User with email: #{user[:email]} already exists in database"
        return false
      else
        create_account(user, type)
        return true
      end
  end

  def create_account(user, type)
    type.to_s.constantize.create! params[:candidate]
        flash[:notice] = "New #{type} created with password: #{params[:candidate][:password]} and email: #{params[:candidate][:email]}"
      sessid = request.session_options[:id].to_i
      if session[:authenticated_users].nil?
        session[:authenticated_users] = {}
      end
      session[:authenticated_users][sessid] = user[:name]
  end


  def modify
    if params[:candidate_bool].nil?
      @recruiter = Recruiter.find_by_name(params[:candidate_name])
      @recruiter.email = params[:candidate_email]
      @recruiter.name = params[:candidate_name]
      @recruiter.password = params[:candidate_password]
      @recruiter.save!
      redirect_to recruiter_path(params[:candidate_name])
    else
      @candidate = Candidate.find_by_name(params[:candidate_name])
      @candidate.email = params[:candidate_email]
      @candidate.name = params[:candidate_name]
      @candidate.password = params[:candidate_password]
      @candidate.save!
      redirect_to candidate_path(params[:candidate_name])
    end
  end

  def update
    Rails.logger.debug "+++++++++++++"
    Rails.logger.debug params
    Rails.logger.debug "+++++++++++++"
    if params[:candidate_boolean].nil?
      redirect_to recruiter_edit_path(params[:candidate_name])
    else
      redirect_to candidate_edit_path(params[:candidate_name])
    end
  end

  def validations(name, email, password)
      return (email.nil? or email.strip.empty? or password.nil? or password.strip.empty? or name.nil? or name.strip.empty?)
    end

end
