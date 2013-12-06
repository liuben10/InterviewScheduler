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

	def show_request_info(request, with)
		date = mdyFormat(request.start_at)
		if with.nil? or with == ""
			with = "UNKNOWN"
		end
		title = request.name
		if title.nil? or title == ""
			title = "WITH NO TITLE"
		end
		"Pending request #{title} from #{with} for an appointment on #{date}"
	end

	def mdyFormat(date)
		date.strftime("%m/%d/%y")
	end
	
end
