module CandidatesHelper

	def show_event_info(event, with)
		date = mdyFormat(event.start_at)
		if with.nil? or with == ""
			with = "UNKNOWN"
		end
		if event.candidate_id.nil?
			pending = "Pending "
		end
		"#{pending}Appointment with #{with} on #{date}"
	end

	def mdyFormat(date)
		date.strftime("%m/%d/%y")
	end
	
end
