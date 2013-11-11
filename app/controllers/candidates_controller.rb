class CandidatesController < UsersController
  def index
  end

  def create
    Rails.logger.debug params
    success = add_user(params[:candidate], :Candidate)
    if success
      redirect_to candidate_path(params[:candidate][:name])
    else
      redirect_to welcome_index_path
    end
  end

  def edit
    Rails.logger.debug params
    @candidate = Candidate.find_by_name(params[:format])
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
