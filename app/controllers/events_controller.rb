class EventsController < ApplicationController
  def create
    Rails.logger.debug "++++++++++++++++"
    Rails.logger.debug params
    Rails.logger.debug "++++++++++++++++"
    startMeridianOffset = params[:start_selection] == "PM" ? 12 : 0
    endMeridianOffset = params[:end_selection] == "PM" ? 12 : 0
    startDate = DateTime.new(params[:start_year].to_i, params[:start_month].to_i+1, params[:start_date].to_i, params[:start_hour].to_i + startMeridianOffset, params[:start_minutes].to_i)
    endDate = DateTime.new(params[:end_year].to_i, params[:end_month].to_i+1, params[:end_date].to_i, params[:end_hour].to_i + endMeridianOffset, params[:end_minutes].to_i)
    Rails.logger.debug startDate.strftime("%FT%T%:z")
    newEventHash = {:name => params[:title], :start_at => startDate, :end_at => endDate, :description => params[:description], :recruiter_id => params[:recruiter_id].to_i}
    recruiter = Recruiter.find(params[:recruiter_id].to_i)
    Rails.logger.debug "++++++++++++++++"
    Rails.logger.debug session
    Rails.logger.debug "++++++++++++++++"
    Event.create! newEventHash
    redirect_to recruiter_path(recruiter.username)
  end
end
