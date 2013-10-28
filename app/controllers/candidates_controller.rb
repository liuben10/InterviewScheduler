class CandidatesController < ApplicationController
  def index
  end
  def create
    Rails.logger.debug "Hello Candidate"
    Rails.logger.debug  params
    email = params[:email]
    name = params[:name]
    debugmsg = "Malformed input: "
    flag = 0
    if email.nil? or email.strip.empty?
      debugmsg += "Email is empty"
      flag = 1
    end
    if name.nil? or name.strip.empty?
      debugmsg += " Name is empty"
      flag = 1
    end
    if flag
      flash[:notice] = debugmsg
    else
      Candidate.create! params[:candidate]
      flash[:notice] = "New Candidate created with name: #{name} and email: #{email}"
    end
    redirect_to welcome_index_path
  end


  def show
    @candidate = Candidate.find_by_id params[:id]
#XXX DEBUG
#@candidate = Candidate.new
#@candidate.name = "Foo"
#@candidate.email = "Bar"
  end
end
