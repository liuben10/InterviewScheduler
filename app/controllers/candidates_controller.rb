class CandidatesController < ApplicationController
  def index
  end

  def show 
    @candidate = Candidate.find_by_username params[:id]
#XXX DEBUG
#@candidate = Candidate.new
#@candidate.name = "Foo"
#@candidate.email = "Bar"
  end

  def create
  	candidate = params[:candidate]
  	success = Candidate.add_candidate(candidate)
  	if success then
  		flash[:notice] = "Account successfully created"
  		redirect_to welcome_index_path
  	else
  		flash[:notice] = "Empty username or password"
  		redirect_to welcome_index_path
  	end
  end

end
