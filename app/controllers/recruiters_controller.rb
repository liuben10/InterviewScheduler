class RecruitersController < ApplicationController
  def index
    @recruiter=Recruiter.new
  end

  def create
    Rails.logger.debug params
    password = params[:candidate][:password]
    email = params[:candidate][:email]
    name = params[:candidate][:name]
    params[:candidate][:company] = params[:company]
    debugmsg = "Malformed input, name, email, password, or company was empty"
    if validations(name, email, password)
      flash[:notice] = debugmsg
      redirect_to welcome_index_path
    elsif not Recruiter.find_by_email(email).nil? and Candidate.find_by_email(email).nil?
      flash[:notice] = "Recruiter with email: #{email} already exists in database"
      redirect_to welcome_index_path
    else
   #    newrecruiterhash[:company] = params[:company]
      Recruiter.create! params[:candidate]
      sessid = request.session_options[:id]
      if session[:authenticated_users].nil?
        session[:authenticated_users] = {}
      end
      session[:authenticated_users][sessid] = name
      flash[:notice] = "New recruiter created with password: #{password} and email: #{email}"
      redirect_to recruiter_path(params[:candidate][:name])
    end
  end

  def validations(name, email, password)
    return (email.nil? or email.strip.empty? or password.nil? or password.strip.empty? or name.nil? or name.strip.empty?)
  end


  def show
#XXX uncomment me
  @recruiter = Recruiter.find_by_name(params[:id])
#    @recruiter = Recruiter.new
#    @recruiter.password = "Foo"
#    @recruiter.email = "Bar"
  end
end
