Feature: allow users to register for new accounts

  As a potential active user
  So that I can evaluate and begin using InterviewScheduler
  I want to be able to register for a new account

Background: the user's account does not already exist

  Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |

  And I am on the InterviewScheduler home page



@javascript
Scenario: non-existant username for potential active candidate
  When I fill in "candidate_username" with "tchang"
  And I fill in "candidate_name" with "tchang"
  And I fill in "candidate_email" with "tchang"
  And I fill in "candidate_password" with "barpass"
  And I select acctype "Candidate"
  And I press "Create"
  Then I should be on the "tchang" candidates page
 
@javascript
Scenario: non-existant username for potential active recruiter
  When I fill in "candidate_username" with "pinkTutus"
  And I fill in "candidate_name" with "pinkTutus"
  And I fill in "candidate_email" with "pinkTutus"
  And I fill in "candidate_password" with "pink"
  And I select acctype "Recruiter"
  And I press "Create"
  Then I should be on the "pinkTutus" recruiters page

@javascript
Scenario: username already exists for potential active recruiter
  When I fill in "candidate_username" with "fluffyBunnies"
  And I fill in "candidate_name" with "fluffyBunnies"
  And I fill in "candidate_email" with "fluffyBunnies"
  And I fill in "candidate_password" with "barpass"
  And I select acctype "Recruiter"
  And I press "Create"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "fluffyBunnies" recruiters page

@javascript
Scenario: username already exists for potential active candidate
  When I fill in "candidate_username" with "nestorga"
  And I fill in "candidate_name" with "nestorga"
  And I fill in "candidate_email" with "nestorga"
  And I fill in "candidate_password" with "barpass"
  And I select acctype "Candidate"
  And I press "Create"
  Then I should be on the InterviewScheduler home page
   And I should not be on the "nestorga" candidates page


@javascript
Scenario: invalid username and valid password for candidate
  When I fill in "candidate_username" with "fluffyBunnies"
  And I fill in "candidate_name" with "fluffyBunnies"
  And I fill in "candidate_email" with "fluffyBunnies"
  And I fill in "candidate_password" with "pass1234"
  And I press "Create"
  Then I should be on the InterviewScheduler home page

@javascript
Scenario: Left some fields empty
  When I fill in "candidate_username" with "radhesh"
  And I press "Create"
  Then I should be on the InterviewScheduler home page
