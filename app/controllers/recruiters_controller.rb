class RecruitersController < ApplicationController
  def index
  end

  def create
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
      Recruiter.create! params[:candidate]
      flash[:notice] = "New recruiter created with name: #{name} and email: #{email}"
    end
     redirect_to [recruiter_show_path, '?', {:userid=>params[:candidate][:name]}.to_query].join
  end

  def show
#XXX uncomment me
  @recruiter = Recruiter.find_by_name(params[:userid])
#    @recruiter = Recruiter.new
#    @recruiter.name = "Foo"
#    @recruiter.email = "Bar"
  end
end
