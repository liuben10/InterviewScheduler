
Given /I am looking at "(.*)" calendar page/ do |user|
   visit calendar_recruiter_path(user)
 end

When /I add an event "(.*)" with candidate "(.*)" starting at "(.*)" and ending at "(.*)"/ do |name, candidate, start, endDate|
  print URI.parse(current_url)
  page.find(:css, "td[data-date='#{start}']").click()
  startarr = start.split(",")
  endarr = endDate.split(",")
  fill_in("title", :with => name)
  fill_in("pending_id", :with => candidate)
 #select(startarr[0], :from => "start_year")
 # select(startarr[1], :from => "start_month")
 # select(startarr[2], :from => "start_date")
 # select(startarr[3], :from => "start_hour")
 # select(startarr[4], :from => "start_minutes")
 # select(endarr[0], :from => "end_year")
 # select(endarr[1], :from => "end_month")
 # select(endarr[2], :from => "end_date")
 # select(endarr[3], :from => "end_hour")
 # select(endarr[4], :from => "end_minutes")
  click_button("submitButton")
end

When /I click on an event "(.*)"/ do |event|
  page.find("span", :text => event).click()
end

Then /^I should see a pending interview request named "(.*)" with "(.*?)" on "(.*?)"$/ do |event, candidate, start_date|
   page.should have_content(event)
end

Then /I should see the event "(.*)" in my events table/ do |event|
  event = Event.find_by_name(event)
  assert_not_nil event
end

Then /"(.*)" should have "(.*)" as description/ do |event, description|
  event = Event.find_by_name(event)
  assert_equal event.description, description
end

Then /"(.*)" does not exist/ do |event|
  res = Event.find_by_name(event)
  assert res.nil?
end
