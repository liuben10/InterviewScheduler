class CandidatesController < UsersController
  def index
  end

  def create
    Rails.logger.debug params
    success = add_user(params[:candidate], :Candidate)
    if success
      redirect_to candidate_path(params[:candidate][:name])
    else
      flash[:notice] = "createError"
      redirect_to welcome_index_path
    end
  end

  def edit
    Rails.logger.debug params
    @candidate = Candidate.find_by_name(params[:id])
  end

  def update
    @candidate = Candidate.find_by_name(params[:id])
    modify(@candidate, :candidate)
    redirect_to candidate_path(@candidate.name)
  end

  def show
    Rails.logger.debug params
    @candidate = Candidate.find_by_name(params[:id])
#    @candidate = Candidate.find_by_userpassword params[:id]
#XXX DEBUG
# @candidate = Candidate.new
  end

end
