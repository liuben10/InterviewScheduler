require "cgi"

class EventsController < ApplicationController
  def create
    startDate = createDate("start")
    endDate = createDate("end")
    if not validations(params, startDate, endDate)
      Rails.logger.debug startDate.strftime("%FT%T%:z")
      newEventHash = {:name => params[:title], :start_at => startDate, :end_at => endDate, :description => params[:description], :pending_id => params[:pending_id], :recruiter_id => params[:recruiter_id]}

      if has_conflict(startDate, endDate, get_candidate_events(params[:pending_id]))
        create_if_candidate_has_conflict(newEventHash)
        flash[:notice] = "Candidate has a conflicting event at this time, creating invitation anyways"
      else
      Event.create! newEventHash
        messageToSend = ""
        messageToSend += "Recruiter " + params[:recruiter_id] + " has invited you to an event on " +  startDate.strftime("%FT%T%:z") + " and ending on " + endDate.strftime("%FT%T%:z") + " and description: " + params[:description]
        message(params[:recruiter_id], params[:pending_id], messageToSend)
      end
    else
      flash[:notice] = "Invalid input, either no invitation was made, start_date didn't come before end_date, or there already is an event at the specified timeslot"
    end
    redirect_to calendar_recruiter_path(params[:recruiter_id])
  end

  def create_if_candidate_has_conflict(event)
    messageToSend = ""
    messageToSend += "Recruiter " + event[:recruiter_id] + " has invited you to an event on " +  event[:start_at].strftime("%FT%T%:z") + " and ending on " + event[:end_at].strftime("%FT%T%:z") + " and description: " + event[:description]

    message(event[:pending_id], event[:recruiter_id], "Candidate has a conflicting event in the interval " +  event[:start_at].strftime("%FT%T%:z") + " to " + event[:end_at].strftime("%FT%T%:z"))
    message(event[:recruiter_id], event[:pending_id], messageToSend)
    Event.create! event
  end

  def validations(params, startDate, endDate)
    return ((params[:pending_id].strip.nil?) or (startDate.to_i > endDate.to_i) or (has_conflict(startDate, endDate, get_recruiter_events(params[:recruiter_id]))))
  end

  def delete
    Event.destroy(params[:id])
    redirect_to welcome_index_path
  end

  def get_recruiter_events(recruiter_id)
    event_set = Event.where(:recruiter_id => recruiter_id)
    return event_set
  end

  def get_candidate_events(candidate_id)
    event_set = Event.where(:candidate_id => candidate_id)
    return event_set
  end

  def get_candidate_pending_events(candidate_id)
    eventRes = Event.where(:pending_id => candidate_id)
  end

  def has_conflict(new_start, new_end, setOfEvents)
    setOfEvents.each do |event|
      if new_start.to_i >= event.start_at.to_i and new_start.to_i <= event.end_at.to_i
        return true
      end
      if new_end.to_i <= event.end_at.to_i and new_end.to_i >= event.start_at.to_i
        return true
      end
    end
    return false
  end

  def update
     @event = Event.find(params[:id])
     if @event.candidate_id.nil? or @event.candidate_id.strip.nil?
        invitation_accepted = "aa"
     end
     @event.name = params[:title]
     @event.start_at = params[:start]
     @event.end_at = params[:end]
     @event.description = params[:description]
     @event.pending_id = params[:pending_id]
     @event.candidate_id = params[:candidate_id]
    @event.save!
     if invitation_accepted == "aa"
       if not @event.candidate_id.nil?
         message(@event.candidate_id, @event.recruiter_id, "Candidate " + @event.candidate_id + " has accepted your invitation for the event " + @event.name)
       end
     end
     redirect_to welcome_index_path
  end


  def show
    @candidate = params[:from_id]
    @event = Event.find(params[:id])
  end

  def createDate(type)
    meridianOffset = params[(type+"_selection").to_sym] == "PM" ? 12 : 0
    date = DateTime.new(params[(type+"_year").to_sym].to_i, params[(type+"_month").to_sym].to_i+1, params[(type+"_date").to_sym].to_i, params[(type+"_hour").to_sym].to_i + meridianOffset, params[(type+"_minutes").to_sym].to_i)
    return date
  end
end
