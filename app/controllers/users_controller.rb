class UsersController < ApplicationController

	def create_account(user)
	    password = user[:password]
	    email = user[:email]
	    name = user[:name]
	    debugmsg = "Malformed input, name, email, password, or company was empty"
	    if validations(name, email, password)
	      flash[:notice] = debugmsg
	      return false
	    elsif not Recruiter.find_by_email(email).nil? and Candidate.find_by_email(email).nil?
	      flash[:notice] = "User with email: #{email} already exists in database"
	      return false
	    else
	      sessid = request.session_options[:id].to_i
	      if session[:authenticated_users].nil?
	        session[:authenticated_users] = {}
	      end
	      session[:authenticated_users][sessid] = name
	      return true
	    end
	end

	def validations(name, email, password)
    	return (email.nil? or email.strip.empty? or password.nil? or password.strip.empty? or name.nil? or name.strip.empty?)
  	end

end