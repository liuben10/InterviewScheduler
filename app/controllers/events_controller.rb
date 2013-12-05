require "cgi"

class EventsController < ApplicationController
  def create
    startDate = createDate("start")
    endDate = createDate("end")
    Rails.logger.debug startDate.strftime("%FT%T%:z")
    messageToSend = ""
    newEventHash = {:name => params[:title], :start_at => startDate, :end_at => endDate, :description => params[:description], :pending_id => params[:pending_id], :recruiter_id => params[:recruiter_id]}
    messageToSend += "Recruiter " + params[:recruiter_id] + " has invited you to an event on " +  startDate.strftime("%FT%T%:z") + " and ending on " + endDate.strftime("%FT%T%:z") + " and description: " + params[:description]
    message(params[:recruiter_id], params[:pending_id], messageToSend)
    Event.create! newEventHash
    redirect_to calendar_recruiter_path(params[:recruiter_id])
  end

  def delete
    Event.destroy(params[:id])
    redirect_to welcome_index_path
  end

  def update
     Rails.logger.debug ";;;;;;;;;;;;;;"
     Rails.logger.debug params
     Rails.logger.debug ";;;;;;;;;;;;;;"
     @event = Event.find(params[:id])
     @event.name = params[:title]
     @event.start_at = params[:start]
     @event.end_at = params[:end]
     @event.description = params[:description]
     @event.pending_id = params[:pending_id]
     @event.candidate_id = params[:candidate_id]
     @event.save!
     redirect_to welcome_index_path
  end

  def show_candidate
    @candidate = params[:from_id]
    @event = Event.find_by_name(params[:id])
    @event.candidate_id = @candidate
    @event.save!
  end

  def show
    @candidate = params[:from_id]
    @event = Event.find_by_name(params[:id])
  end

  def createDate(type)
    meridianOffset = params[(type+"_selection").to_sym] == "PM" ? 12 : 0
    date = DateTime.new(params[(type+"_year").to_sym].to_i, params[(type+"_month").to_sym].to_i+1, params[(type+"_date").to_sym].to_i, params[(type+"_hour").to_sym].to_i + meridianOffset, params[(type+"_minutes").to_sym].to_i)
    return date
  end
end
