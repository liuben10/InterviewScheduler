Given /the following accounts exist/ do |account_table|
  account_table.hashes.each do |account|
    if account["type"] == "recruiter"
      account.delete("type")
      Recruiter.create! account
    else
      account.delete("type")
      Candidate.create! account
    end
  end
end

Given /the (candidate|recruiter) "(.*)" is associated with the following (recruiters|candidates)/ do |user_type, username, assn_type, assn_table|
  assn_table.hashes.each do |assn|
    if user_type == "candidate"
      user = Candidate.find_by_username(username)
      user.recruiters << Recruiter.find_by_username(assn["username"])
    else
      user = Recruiter.find_by_username(username)
      user.candidates << Candidate.find_by_username(assn["username"])
    end
  end
end

Given /I am logged in as "(.*)" with password "(.*)"/ do |username, password|
  steps %Q{
    Given I am on the InterviewScheduler homepage
    When I fill in "userid" with "#{username}"
    And I fill in "password" with "#{password}"
    And I press "Login"
  }
end

Then /I should( not)? see (candidate|recruiter) "(.*)" with the email "(.*)" and the name "(.*)"/ do |not_see, type, username, email, name|
  usernames = page.all("table##{type}s td#username").map(&:text)
  emails = page.all("table##{type}s td#email").map(&:text)
  names = page.all("table##{type}s td#name").map(&:text)
  if not_see
    usernames.should_not include(username)
  else
    usernames.should include(username)
    emails.should include(email)
    names.should include(name)
  end
end

Then /the password for "(.*)" should be "(.*)"/ do |username, password|
  user ||= Candidate.find_by_username(username)
  user ||= Recruiter.find_by_username(username)
  assert_equal user.password, password
end

Then /the email for "(.*)" should be "(.*)"/ do |username, email|
  user ||= Candidate.find_by_username(username)
  user ||= Recruiter.find_by_username(username)
  assert_equal user.email, email
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  #print path_to(page_name)
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

#XXX added
Then /^(?:|I )should not be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should_not == path_to(page_name)
  else
    assert_not_equal path_to(page_name), current_path
  end
end

When /I select acctype "(.*)"$/ do |acctype|
  #print acctype
  select(acctype, :from=>"acctype")
end

When /I press the wrench icon/ do
  click_link("Edit")
end

When /I press the list icon/ do
  click_link("List")
end
