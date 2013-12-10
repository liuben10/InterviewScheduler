Given /the following events exist/ do |event_table|
    event_table.hashes.each do |event|
      startdate = event[:start_at].split('-')
      enddate = event[:end_at].split('-')
      event[:start_at] = DateTime.new(startdate[0].to_i, startdate[1].to_i, startdate[2].to_i)
      event[:end_at] = DateTime.new(enddate[0].to_i, enddate[1].to_i, enddate[2].to_i)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Event.create(event)
  end
end

Then /^I should see the appointment with "(.*)" on "(.*)" before "(.*)" on "(.*)"$/ do |meet1, date1, meet2, date2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  page.body.match(/#{meet1}(.|\n)*#{date1}(.|\n)*#{meet2}(.|\n)*#{date2}/).should_not be(nil)
end

Then /^I should (not )?see an appointment with "(.*)" on "(.*)"$/ do |not_see, meet_with, date|
  if not_see
    page.body.match(/#{meet_with}(.|\n)*#{date}(.|\n)*/).should be(nil)
  else
    page.body.match(/#{meet_with}(.|\n)*#{date}(.|\n)*/).should_not be(nil)
  end
end

Then /^I should (not )?see a pending interview request named "(.*)" with "(.*?)" on "(.*?)"$/ do |not_see, event, recruiter, start_date|
  events = page.all("table#pending_requests td#title").map(&:text)
  recruiters = page.all("table#pending_requests td#meet_with").map(&:text)
  start_dates = page.all("table#pending_requests td#date").map(&:text)
  if not_see
    events.should_not include(event)
  else
    events.should include(event)
    recruiters.should include(recruiter)
    start_dates.should include(start_date)
  end
end
