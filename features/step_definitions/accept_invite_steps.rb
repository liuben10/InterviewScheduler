Given /I am on "(.*)" event page as "(.*)"/ do |event, user|
  visit "/events/show/" + event + "?from_id=" + user
end

When /I am looking at "(.*)" event page as "(.*)"/ do |event, user|
  visit "/event/show/" + event + "?from_id=" + user
  print URI.parse(current_url)
end

Then /event "(.*)" should have "(.*)" as accepted/ do |event, user|
  event = Event.find_by_name(event)
  assert_equal event.candidate_id, user
end
