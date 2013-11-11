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


  def modify(user, type)
    user.email = params[type][:email]
    user.name = params[type][:name]
    user.password = params[type][:password]
    user.save!
  end

  def validations(name, email, password)
      return (email.nil? or email.strip.empty? or password.nil? or password.strip.empty? or name.nil? or name.strip.empty?)
    end

end
