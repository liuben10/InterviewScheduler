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
    user.email = params[type][:email]
    user.name = params[type][:name]
    user.password = params[type][:password]
    user.save!
  end

<<<<<<< HEAD
  def validations(name, email, password)
      return (email.nil? or email.strip.empty? or password.nil? or password.strip.empty? or name.nil? or name.strip.empty?)
  end
=======
  def show_events_for_user(user)
  end

  def validations(name, email, password, username)
      return (email.nil? or email.strip.empty? or password.nil? or password.strip.empty? or name.nil? or name.strip.empty? or username.nil? or username.strip.empty?)
    end
>>>>>>> 6929ef83878e4d2a86e26931de4c362fc073c20d

end
