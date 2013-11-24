class Event < ActiveRecord::Base
  has_event_calendar
    attr_accessible :name, :pending_id, :candidate_id, :recruiter_id, :description, :start_at, :end_at
 end
