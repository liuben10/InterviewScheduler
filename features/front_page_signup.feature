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
  When I fill in "candidate_name" with "tchang"
  When I fill in "candidate_email" with "barpass"
  When I select acctype "Candidate"
  When I press "signupbutton"
  Then I should be on the "tchang" candidates page
 
@javascript
Scenario: non-existant username for potential active recruiter
  When I fill in "candidate_name" with "pinkTutus"
  When I fill in "candidate_email" with "pink"
  When I select acctype "Recruiter"
  When I press "signupbutton"
  Then I should be on the "pinkTutus" recruiters page

@javascript
Scenario: username already exists for potential active recruiter
  When I fill in "candidate_name" with "fluffyBunnies"
  When I fill in "candidate_email" with "barpass"
  When I select acctype "Recruiter"
  When I press "signupbutton"
  Then I should be on the InterviewScheduler home page
  And I should not be on a recruiter profile page
  And I should not be on the "fluffyBunnies" recruiters page
@javascript
Scenario: username already exists for potential active candidate
  When I fill in "candidate_name" with "nestorga"
  When I fill in "candidate_email" with "barpass"
  When I select acctype "Candidate"
  When I press "signupbutton"
  Then I should be on the InterviewScheduler home page
   And I should not be on the "nestorga" candidates page


@javascript
Scenario: invalid username and valid password for candidate
  When I fill in "candidate_name" with "fluffyBunnys"
  When I fill in "candidate_email" with "pass1234"
  When I press "signupbutton"
  Then I should be on the InterviewScheduler home page
