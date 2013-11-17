class CandidatesController < UsersController
  
  def index
  end

  def create
    Rails.logger.debug params
    success = add_user(params[:candidate], :Candidate)
    if success
      redirect_to candidate_path(params[:candidate][:id])
    else
      flash[:notice] = "createError"
      redirect_to welcome_index_path
    end
  end

  def edit
    @candidate = Candidate.find_by_id(params[:id])
  end

  def update
    @candidate = Candidate.find_by_id(params[:id])
    modify(@candidate, :candidate)
    redirect_to candidate_path(@candidate.id)
  end

  def show
    @candidate = Candidate.find_by_id(params[:id])
  end

  def list
    @candidate = Candidate.find_by_id(params[:id])
    @recruiters = @candidate.recruiters    
  end
  
  def add_recruiter
    
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
