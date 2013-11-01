Feature: allow users to login to their accounts

  As an end user
  So that I can view information related to my account
  I want to be able to login and view my acconut profile

Background: the user's account already exists

  Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |

  And I am on the InterviewScheduler home page

@javascript
Scenario: valid username and password for recruiter
  When I fill in "userid" with "fluffyBunnies"
  When I fill in "passid" with "pass1234"
  When I press "submitpass"
  Then I should be on the "fluffyBunnies" recruiter page
  And I should be on a recruiter profile page
  And I should not be on the InterviewScheduler home page

@javascript
Scenario: valid username and password for candidate
  When I fill in "userid" with "nestorga"
  When I fill in "passid" with "fooPass3"
  When I press "submitpass"
  Then I should be on the "nestorga" candidate page
  And I should be on a candidate profile page
  And I should not be on the InterviewScheduler home page

@javascript
Scenario: valid username and invalid password for recruiter
  When I fill in "userid" with "fluffyBunnies"
  When I fill in "passid" with "secure!p@ss"
  When I press "submitpass"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "fluffyBunnies" recruiter page
  And I should not be on a recruiter profile page
@javascript
Scenario: valid username and invalid password for candidate
  When I fill in "userid" with "efriesen"
  When I fill in "passid" with "pass1234"
  When I press "submitpass"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "efriesen" candidate page
  And I should not be on a candidate profile page

@javascript
Scenario: invalid username and valid password for candidate
  When I fill in "userid" with "efreise"
  When I fill in "passid" with "secure!p@ss"
  When I press "submitpass"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "efriesen" candidate page
  And I should not be on a candidate profile page

@javascript
Scenario: invalid username and valid password for recruiter
  When I fill in "userid" with "fluffyBunnys"
  When I fill in "passid" with "pass1234"
  When I press "submitpass"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "fluffyBunnies" recruiter page
  And I should not be on a recruiter profile page

