class RecruitersController < UsersController
  def index
    @recruiter=Recruiter.new
  end

  def create
    Rails.logger.debug params
    params[:candidate][:company] = params[:company]
    success = add_user(params[:candidate], :Recruiter)
    if success
      redirect_to recruiter_path(params[:candidate][:name])
    else
      redirect_to welcome_index_path
    end
  end

  def edit
    Rails.logger.debug params
    @recruiter = Recruiter.find_by_name(params[:id])
  end

  def update
    @recruiter = Recruiter.find_by_name(params[:id])
    modify(@recruiter, :recruiter)
    redirect_to recruiter_path(@recruiter.name)
  end

  def show
#XXX uncomment me
  @recruiter = Recruiter.find_by_name(params[:id])
#    @recruiter = Recruiter.new
#    @recruiter.password = "Foo"
#    @recruiter.email = "Bar"
  end
end
