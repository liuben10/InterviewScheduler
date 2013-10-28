class WelcomeController < ApplicationController
  def index
    @candidate = Candidate.new
    Rails.logger.debug "Hello?"
    Rails.logger.debug @candidate.methods

  end
end
