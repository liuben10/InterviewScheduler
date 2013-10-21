class WelcomeController < ApplicationController
  def index
    @candidate = Candidate.new
  end
end
