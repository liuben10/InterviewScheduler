require "cgi"

class RecruitersController < UsersController
  before_filter :except => [:create] { |c|
    c.authorize params[:id], :recruiter
  }

  respond_to :json

  def index
    @recruiter=Recruiter.new
  end

  def create
    #Creates a new recruiter similar to candidate.
    Rails.logger.debug params
    params[:candidate][:company] = params[:company]
    #Redirects to add_user in user_controller.
    success = add_user(params[:candidate], :Recruiter)
    if success
      #If the user was successfully added, redirect to the user's profile page. Otherwise redirect to front page with error.
      redirect_to recruiter_path(params[:candidate][:username])
    else
      flash[:notice] = "createError"
      redirect_to welcome_index_path
    end
  end

  def edit
    @recruiter = Recruiter.find_by_username(params[:id])
  end

  def update
    @recruiter = Recruiter.find_by_username(params[:id])
    modify(@recruiter, :recruiter)
    redirect_to recruiter_path(@recruiter.username)
  end

  def show
    @recruiter = Recruiter.find_by_username(params[:id])
    @events = get_events(@recruiter, "recruiter")
  end

  def list
    @recruiter = Recruiter.find_by_username(params[:id])
    @candidates = @recruiter.candidates
  end

  def calendar
    require 'json'
    @recruiter = Recruiter.find_by_username(params[:id])
    @events = get_events(@recruiter, "recruiter")
   end

  def add_candidate
    @recruiter = Recruiter.find_by_username(params[:id])
    @candidate = Candidate.find_by_username(params[:candidate])
    if @candidate
      @recruiter.candidates << @candidate
      redirect_to list_recruiter_path(@recruiter.username)
    else
      flash[:error] = "Could not find the recruiter with that username"
      redirect_to list_recruiter_path(@recruiter.username)
    end
  end

  def message_candidate
    @recruiter = Recruiter.find_by_username(session[:authenticated_user])
    @candidate = Candidate.find_by_username(params[:candidate])
    @message = CGI::escapeHTML(params[:message])
    if @candidate
      UserMailer.recruiter_send(@recruiter, @candidate, @message)
                .deliver
      flash[:notice] = "Message successfully sent!"
    else
      flash[:error] = "Invalid candidate name specified."
    end
    redirect_to list_recruiter_path(@recruiter.username)
  end
end
