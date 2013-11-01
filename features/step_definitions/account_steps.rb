Given /the following accounts exist/ do |account_table|
  account_table.hashes.each do |account|
    newaccounthash = {}
    print account
    newaccounthash["name"] = account["username"]
    newaccounthash["email"] = account["password"]
    print newaccounthash
    if account["type"] == "recruiter"
      Recruiter.create! newaccounthash
    else
      Candidate.create! newaccounthash
    end
  end
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
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
    current_path.should != path_to(page_name)
  else
    assert_not_equal path_to(page_name), current_path
  end
end

When /I select acctype "(.*)"$/ do |acctype|
  select(acctype, :from=>"acctype")
end
