class RecruitersController < ApplicationController
  def index
  end

  def create
    name = params[:candidate][:name]
    email = params[:candidate][:email]
    debugmsg = "Malformed input, email or name was empty"
    if email.nil? or email.strip.empty? or name.nil? or name.strip.empty?
      flash[:notice] = debugmsg
      redirect_to welcome_index_path
    else
      Recruiter.create! params[:candidate]
      flash[:notice] = "New recruiter created with name: #{name} and email: #{email}"
      redirect_to recruiter_path(params[:candidate][:name])
    end

  end

  def show
#XXX uncomment me
  @recruiter = Recruiter.find_by_name(params[:id])
#    @recruiter = Recruiter.new
#    @recruiter.name = "Foo"
#    @recruiter.email = "Bar"
  end
end
