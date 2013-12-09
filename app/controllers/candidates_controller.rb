class CandidatesController < UsersController

  before_filter :except => [:create] {|c|
    c.authorize params[:id], :candidate
  }

  def index
  end


  def mailbox
    @candidate = params[:id]
    @type = params[:type]
    @mail = get_mail(@candidate, @type)
  end

  def create
    Rails.logger.debug params
    #Creates a candidate.
    #redirects to add_user in user_controller. The add_user actually creates the user
    success = add_user(params[:candidate], :Candidate)
    if success
      #If the candidate was successfully created, redirect to the correct candidate profile page.
      #Otherwise, redirect to the front page with error that user already exists or validation was incorrect.
      redirect_to candidate_path(params[:candidate][:username])
    else
      flash[:notice] = "createError"
      redirect_to welcome_index_path
    end
  end

  def edit
    #Shows the corresponding edit page.
    @candidate = Candidate.find_by_username(params[:id])
  end

  def view
    @profile = Recruiter.find_by_username(params[:profile_id])
    @src_id = params[:id]
  end

  def search
    @keyword = params[:keyword]
    @candidate = params[:candidate]
    @recruiters = search_helper(params[:keyword], "candidate")
  end

  def update
    #perfoms the actual update.
    @candidate = Candidate.find_by_username(params[:id])
    #Redirects to the modify in user_controller.  Just updates the specific entries for a candidate
    modify(@candidate, :candidate)
    #Redirects upon update to the candidate profile page.
    redirect_to candidate_path(@candidate.username)
  end

  def show
    #Redirects to the candidate view
    @candidate = Candidate.find_by_username(params[:id])
    @events = Event.find(:all, :conditions=>["pending_id = ? and end_at > ?", @candidate.username, DateTime.now], :order=>"start_at ASC", :limit=>5)
    @requests = Event.find(:all, :conditions=>["pending_id = ? and end_at > ? and (candidate_id = '' or candidate_id IS NULL)", @candidate.username, DateTime.now], :order=>"start_at ASC", :limit=>5)
  end

  def list
    @candidate = Candidate.find_by_username(params[:id])
    @recruiters = @candidate.recruiters
  end

  def calendar
    @candidate = Candidate.find_by_username(params[:id])
    @events =  Event.find(:all, :conditions=>["pending_id = ?", @candidate.username])
  end

  def add_recruiter
    @candidate = Candidate.find_by_username(params[:id])
    @recruiter = Recruiter.find_by_username(params[:recruiter])
    if @recruiter
      @candidate.recruiters << @recruiter
      redirect_to list_candidate_path(@candidate.username)
    else
      flash[:error] = "Could not find the recruiter with that username"
      redirect_to list_candidate_path(@candidate.username)
    end
  end
end
