class CandidatesController < ApplicationController
  def index
  end

  def show 
    @candidate = Candidate.find_by_id params[:id]
#XXX DEBUG
#@candidate = Candidate.new
#@candidate.name = "Foo"
#@candidate.email = "Bar"
  end
end
