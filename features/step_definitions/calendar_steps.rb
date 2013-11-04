Given /the following appointments exist/ do |appt_table|
	  appt_table.hashes.each do |appt|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Appointments.create(appt)
  end
end

Then /I should (not )?see an appointment with "(.*)" on "(.*)"/ do |meet_with, date|
	assert false
end
