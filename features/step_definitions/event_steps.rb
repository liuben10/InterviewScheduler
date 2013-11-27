
Given /I am on "(.*)" calendar page/ do |user|
  link = page.find(".fi-calendar profile-icon")
  link.click()
end

When /I add an event "(.*)" starting at "(.*)" and ending at "(.*)"/ do |name, start, endDate|
  page.find(:css, "td[data-date='2013-11-11']").click()
  startarr = start.split(",")
  endarr = endDate.split(",")
  print
  fill_in("title", :with => name)
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

Then /I should see the even I added in my events table/ do
  event = Event.find_by_name(@name)
  assert_not_nil event
end
