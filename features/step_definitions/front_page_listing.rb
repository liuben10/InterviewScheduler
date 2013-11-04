Given /^the following information of the candidates$/ do |cand_table|
  cand_table.hashes.each do |cand|
    CandidateListings.create(cand)
  end
end


Then /^I should see the candidate "(.*)" with the (status | email) of "(.*)"$/ do |cand, check, val|
  if check == "status"
    a = Recruiter.getCandidate(cand).getStatus()
    assert_equal val, a
  elsif check == "email"
    a = Recruiter.getCandidate(cand).getEmail()
    assert_equal val, a


Given /^the following information of the recruiters$/ do |rec_table|
  rec_table.hashes.each do |rec|
    RecruiterListings.create(rec)
  end
end


Then /^I should see the recruiter "(.*)" with the (status | email) of "(.*)"$/ do |rec, check, val|
  if check == "status"
    a = Candidate.getRecruiter(rec).getStatus()
    assert_equal val, a
  elsif check == "email"
    a = Candidate.getRecruiter(rec).getEmail()
    assert_equal val, a
