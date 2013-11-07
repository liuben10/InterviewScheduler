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
      flash[:notice] = "New recruiter created with password: #{password} and email: #{email}"
      redirect_to recruiter_path(params[:candidate][:password])
    end
  end

  def validations(name, email, password)
    return (email.nil? or email.strip.empty? or password.nil? or password.strip.empty? or name.nil? or name.strip.empty?)
  end


  def show
#XXX uncomment me
  @recruiter = Recruiter.find_by_password(params[:id])
#    @recruiter = Recruiter.new
#    @recruiter.password = "Foo"
#    @recruiter.email = "Bar"
  end
end
