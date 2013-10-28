class RecruitersController < ApplicationController
  def index
  end

  def show 
#XXX uncomment me
#@recruiter = Recruiter.find_by_id params[:id]
    @recruiter = Recruiter.new
    @recruiter.name = "Foo"
    @recruiter.email = "Bar"
  end
end
