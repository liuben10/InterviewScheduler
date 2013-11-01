class CandidatesController < ApplicationController
  def index
  end
  def create
    Rails.logger.debug "Hello Candidate"
    Rails.logger.debug  params
    name = params[:candidate][:name]
    email = params[:candidate][:email]
    debugmsg = "Malformed input: "
    flag = false
    if email.nil? or email.strip.empty?
      debugmsg += "Email is empty"
      flag = true
    end
    if name.nil? or name.strip.empty?
      debugmsg += " Name is empty"
      flag = true
    end
    if flag
      flash[:notice] = debugmsg
    else
      Candidate.create! params[:candidate]
      flash[:notice] = "New Candidate created with name: #{name} and email: #{email}"
    end
    redirect_to welcome_index_path
  end

  def show
    Rails.logger.debug params
    @candidate = Candidate.find_by_name(params[:userid])
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
