require "cgi"

class EventsController < ApplicationController
  def create
    startDate = createDate("start")
    endDate = createDate("end")
    if not validations(params, startDate, endDate)
      newEventHash = {:name => params[:title], :start_at => startDate, :end_at => endDate, :description => params[:description], :pending_id => params[:pending_id], :recruiter_id => params[:recruiter_id]}
      Event.create! newEventHash
      sendMessageFromRecruiter(params)
    else
      flash[:notice] = "Invalid input, either no invitation was made, start_date didn't come before end_date, or there is a conflict with the recruiter or the candidate"
    end
    redirect_to calendar_recruiter_path(params[:recruiter_id])
  end

  def sendMessageFromRecruiter(params)
    messageToSend = ""
    messageToSend += "Recruiter " + params[:recruiter_id]
    messageToSend += " has invited you to an event on " +  startDate.strftime("%FT%T%:z")
    messageToSend += " and ending on " + endDate.strftime("%FT%T%:z") + " and description: " + params[:description]
    message(params[:recruiter_id], params[:pending_id], messageToSend)
  end

=begin
  def create_if_candidate_has_conflict(event)
    messageToSend = ""
    messageToSend += "Recruiter " + event[:recruiter_id] + " has invited you to an event on " +  event[:start_at].strftime("%FT%T%:z") + " and ending on " + event[:end_at].strftime("%FT%T%:z") + " and description: " + event[:description]

   message(event[:pending_id], event[:recruiter_id], "Candidate has a conflicting event in the interval " +  event[:start_at].strftime("%FT%T%:z") + " to " + event[:end_at].strftime("%FT%T%:z"))
    message(event[:recruiter_id], event[:pending_id], messageToSend)
    Event.create! event
  end
=end

  def validations(params, startDate, endDate)
    return (((params[:pending_id].strip.nil?) or params[:pending_id].nil? or params[:pending_id].empty?) or (params[:title].nil?) or (startDate.to_i > endDate.to_i) or (has_conflict(startDate, endDate, get_recruiter_events(params[:recruiter_id]))) or (has_conflict(startDate, endDate, get_candidate_events(params[:recruiter_id]))))
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
      if conflicting_intervals(new_start, new_end, event)
        return true
      end
    end
    return false
  end

  def conflicting_intervals(new_start, new_end, event)
    return (start_is_between_interval(new_start, event) or end_is_between_interval(new_end, event))
  end

  def start_is_between_interval(new_start, event)
    return ((new_start.to_i >= event.start_at.to_i) and (new_start.to_i <= event.end_at.to_i))
  end

  def end_is_between_interval(new_end, event)
    return ((new_end.to_i <= event.end_at.to_i) and (new_end.to_i >= event.start_at.to_i))
  end

  def update
    @event = Event.find(params[:id])
    @event.name = params[:title]
    @event.start_at = params[:start]
    @event.end_at = params[:end]
    @event.description = params[:description]
    @event.pending_id = params[:pending_id]
    @event.candidate_id = params[:candidate_id]
    @event.save!
    if not @event.candidate_id.nil?
      message(@event.candidate_id, @event.recruiter_id, "Candidate " + @event.candidate_id + " has accepted your invitation for the event " + @event.name)
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
