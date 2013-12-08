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
    if type.to_s == "Candidate"
      UserMailer.welcome_candidate(Candidate.find_by_name(params[:candidate][:name]))
                .deliver
    elsif type.to_s == "Recruiter"
      UserMailer.welcome_recruiter(Recruiter.find_by_name(params[:candidate][:name]))
                .deliver
    end
  end

  def modify(user, type)
    user.attach = params[type][:attach]
    user.pic = params[type][:pic]
    user.email = params[type][:email]
    user.name = params[type][:name]
    user.password = params[type][:password]
    user.save!
  end

  def get_events(user, type)
    if type == "recruiter"
      @user_events = Event.where(:recruiter_id => user.username)
    else
      @user_events = Event.where(:candidate_id => user.username)
    end
    return @user_events
  end

  def get_mail(user, type)
    if type == "inbox"
      @mail = Message.where(:to => user)
    else
      @mail = Message.where(:from => user)
    end
    return @mail
  end

  def validations(name, email, password, username)
      return (email.nil? or email.strip.empty? or password.nil? or password.strip.empty? or name.nil? or name.strip.empty? or username.nil? or username.strip.empty?)
    end

end
