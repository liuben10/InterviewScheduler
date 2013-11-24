module CandidatesHelper
	def mdyFormat(date)
		date.strftime("%m/%d/%y")
	end

	def username(id, type)
		user = type.to_s.constantize.find(id)
		user.username
	end
end
