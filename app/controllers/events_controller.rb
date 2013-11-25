class EventsController < ApplicationController
  def create
    Rails.logger.debug "++++++++++++++++"
    Rails.logger.debug params
    Rails.logger.debug "++++++++++++++++"
    startDate = createDate("start")
    endDate = createDate("end")
    Rails.logger.debug startDate.strftime("%FT%T%:z")
    newEventHash = {:name => params[:title], :start_at => startDate, :end_at => endDate, :description => params[:description], :pending_id => params[:pending_id], :recruiter_id => params[:recruiter_id]}
    Rails.logger.debug "++++++++++++++++"
    Rails.logger.debug session
    Rails.logger.debug "++++++++++++++++"
    Event.create! newEventHash
    redirect_to calendar_recruiter_path(params[:recruiter_id])
  end

  def update

  end
  def show

  end

  def createDate(type)
    meridianOffset = params[(type+"_selection").to_sym] == "PM" ? 12 : 0
    date = DateTime.new(params[(type+"_year").to_sym].to_i, params[(type+"_month").to_sym].to_i+1, params[(type+"_date").to_sym].to_i+1, params[(type+"_hour").to_sym].to_i + meridianOffset, params[(type+"_minutes").to_sym].to_i)
    return date
  end
end
