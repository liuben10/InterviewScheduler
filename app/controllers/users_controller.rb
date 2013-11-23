class UsersController < ApplicationController

  def add_user(user, type)
    #type is a symbolized version of a class name
      debugmsg = "Malformed input, name, email, password, or company was empty"
    #If any of these fields are empty, throw an error that the validation failed.
      if validations(user[:name], user[:email], user[:password], user[:username])
        flash[:notice] = debugmsg
        return false
      elsif not (Recruiter.find_by_username(user[:username]).nil? and Candidate.find_by_username(user[:username]).nil?)
        #If a user already exists, return an error and specify the user with the username already exists.
        flash[:notice] = "User with username: #{user[:username]} already exists in database"
        return false
      else
        create_account(user, type)
        return true
      end
  end

  def create_account(user, type)
    type.to_s.constantize.create! params[:candidate]
        flash[:notice] = "New #{type} created with password: #{params[:candidate][:password]} and email: #{params[:candidate][:email]}"
      session[:authenticated_user] = user[:username]
  end

  def modify(user, type)
    nowTime = Time.new
    Rails.logger.debug "abcde"
    Rails.logger.debug params[type][:attach].methods
    user.attach_file_name = params[type][:attach].original_filename
    user.attach_content_type = params[type][:attach].content_type
    user.attach_file_size = params[type][:attach].size
    user.attach_updated_at = nowTime
    user.attach = params[type][:attach]
    user.email = params[type][:email]
    user.name = params[type][:name]
    user.password = params[type][:password]
    user.save!
  end

  def get_events(user, type)
    if type == "recruiter"
      @user_events = Event.where(:recruiter_id => user.id)
    else
      @user_events = Event.where(:candidate_id => user.id)
    end
    return @user_events
  end

  def validations(name, email, password, username)
      return (email.nil? or email.strip.empty? or password.nil? or password.strip.empty? or name.nil? or name.strip.empty? or username.nil? or username.strip.empty?)
    end

end
