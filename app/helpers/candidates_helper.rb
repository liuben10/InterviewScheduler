module CandidatesHelper

	def show_event_info(event, with)
		date = mdyFormat(event.start_at)
		if with.nil? or with == ""
			with = "UNKNOWN"
		end
		if event.candidate_id.nil?
			pending = "Pending"
		else
		  pending = "Scheduled"
		end
		title = event.name
		if title.nil? or title == ""
		  title = "NO TITLE"
		end
		[title, with, pending, date]
	end

	def show_request_info(request, with)
		date = mdyFormat(request.start_at)
		if with.nil? or with == ""
			with = "UNKNOWN"
		end
		title = request.name
		if title.nil? or title == ""
			title = "NO TITLE"
		end
		[title, with, date]
	end
	
	def mdyFormat(date)
    date.strftime("%m/%d/%y")
  end

end
