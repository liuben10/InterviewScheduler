class CandidatesController < ApplicationController
  def index
  end
  
  def create
    name = params[:candidate][:name]
    email = params[:candidate][:email]
    debugmsg = "Malformed input, email or name was empty"
    if email.nil? or email.strip.empty? or name.nil? or name.strip.empty?
      flash[:notice] = debugmsg
      redirect_to welcome_index_path
    elsif not Candidate.find_by_name(name).nil? and Recruiter.find_by_name(name).nil?
      flash[:notice] = "Candidate with name: #{name} already exist in database"
      redirect_to welcome_index_path
    else
      Candidate.create! params[:candidate]
      flash[:notice] = "New Candidate created with name: #{name} and email: #{email}"
      redirect_to candidate_path(params[:candidate][:name])
    end

  end

  def show
    Rails.logger.debug params
    @candidate = Candidate.find_by_name(params[:id])
#    @candidate = Candidate.find_by_username params[:id]
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
 #    flash[:notice] = "Empty username or password"
 #    redirect_to welcome_index_path
 #  end
 # end

end
