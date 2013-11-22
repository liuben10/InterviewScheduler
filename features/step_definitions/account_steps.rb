Given /the following accounts exist/ do |account_table|
  account_table.hashes.each do |account|
    newaccounthash = {}
    #print account
    newaccounthash["username"] = account["username"]
    newaccounthash["password"] = account["password"]
    #newaccounthash["email"] = account["email"]
    #print newaccounthash
    if account["type"] == "recruiter"
      Recruiter.create! newaccounthash
    else
      Candidate.create! newaccounthash
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
