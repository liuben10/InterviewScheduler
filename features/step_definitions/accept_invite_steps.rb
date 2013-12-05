Given /I am on "(.*)" event page as "(.*)"/ do |event, user|
  visit "/events/show/" + event + "?from_id=" + user
end
