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

When /I select acctype "(.*)"$/ do |acctype|
  select(acctype, :from=>"acctype")
end
