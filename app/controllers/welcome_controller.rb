class WelcomeController < ApplicationController
  def index
    @candidate = Candidate.new
    Rails.logger.debug "Hello?"
    Rails.logger.debug @candidate.methods

  end

  def show
    Rails.logger.debug params


  end
end
