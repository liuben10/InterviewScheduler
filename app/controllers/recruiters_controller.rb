class RecruitersController < UserController
  def index
    @recruiter=Recruiter.new
  end

  def create
    Rails.logger.debug params
    params[:candidate][:company] = params[:company]
    success = create_account(params[:candidate])
    if success
      Recruiter.create! params[:candidate]
      flash[:notice] = "New Recruiter created with password: #{params[:candidate][:password]} and email: #{params[:candidate][:email]}"
      redirect_to recruiter_path(params[:candidate][:name])
    else
      redirect_to welcome_index_path
    end
  end

  def show
#XXX uncomment me
  @recruiter = Recruiter.find_by_name(params[:id])
#    @recruiter = Recruiter.new
#    @recruiter.password = "Foo"
#    @recruiter.email = "Bar"
  end
end
