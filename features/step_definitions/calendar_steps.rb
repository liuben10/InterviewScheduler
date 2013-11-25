Given /the following events exist/ do |event_table|
    event_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Event.create(event)
  end
end

Then /^I should see the appointment with "(.*)" on "(.*)" before "(.*)" on "(.*)"$/ do |meet1, date1, meet2, date2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  page.body.match(/#{meet1} on #{date1}(.|\n)*#{meet2} on #{date2}/).should_not be(nil)
end

Then /^I should (not )?see an appointment with "(.*)" on "(.*)"$/ do |not_see, meet_with, date|
  if not_see
    steps %Q{
      Then I should not see "#{meet_with} on #{date}"
    }
  else
    steps %Q{
      Then I should see "#{meet_with} on #{date}"
    }
  end
end
