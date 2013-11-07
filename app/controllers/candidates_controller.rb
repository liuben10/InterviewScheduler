class CandidatesController < ApplicationController
  def index
  end

  def create
    Rails.logger.debug params
    password = params[:candidate][:password]
    email = params[:candidate][:email]
    name = params[:candidate][:name]
    debugmsg = "Malformed input, name, email,or password was empty"
    if validations(name, email, password)
      flash[:notice] = debugmsg
      redirect_to welcome_index_path
    elsif not Candidate.find_by_email(email).nil? and Recruiter.find_by_email(email).nil?
      flash[:notice] = "Candidate with email: #{email} already exists in database"
      redirect_to welcome_index_path
    else
      Candidate.create! params[:candidate]
      flash[:notice] = "New Candidate created with password: #{password} and email: #{email}"
      redirect_to candidate_path(params[:candidate][:name])
    end
  end


  def validations(name, email, password)
    return (email.nil? or email.strip.empty? or password.nil? or password.strip.empty? or name.nil? or name.strip.empty?)
  end

  def show
    Rails.logger.debug params
    @candidate = Candidate.find_by_name(params[:id])
#    @candidate = Candidate.find_by_userpassword params[:id]
#XXX DEBUG
# @candidate = Candidate.new

  end


 #Radhesh's create; can be deleted if current create does the job
 # def create
 #  candidate = params[:candidate]
 #  success = Candidate.add_candidate(candidate)
 #  if success then
 #    flash[:notice] = "Account successfully created"
 #    redirect_to welcome_index_path
 #  else
 #    flash[:notice] = "Empty userpassword or password"
 #    redirect_to welcome_index_path
 #  end
 # end

end
