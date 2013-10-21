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

Scenario: valid username and password for recruiter
  When I fill in "loguserid" with "fluffyBunnies"
  When I fill in "logpassid" with "pass1234"
  When I press "submit"
  Then I should be on the "fluffyBunnies" profile page
  And I should be on a recrutier profile page
  And I should not be on the InterviewScheduler home page

Scenario: valid username and password for candidate
  When I fill in "loguserid" with "nestorga"
  When I fill in "logpassid" with "fooPass3"
  When I press "submit"
  Then I should be on the "nestorga" profile page
  And I should be on a candidate profile page
  And I should not be on the InterviewScheduler home page

Scenario: valid username and invalid password for recruiter
  When I fill in "loguserid" with "fluffyBunnies"
  When I fill in "logpassid" with "secure!p@ss"
  When I press "submit"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "fluffyBunnies" profile page
  And I should not be on a recruiter profile page

Scenario: valid username and invalid password for candidate
  When I fill in "loguserid" with "efriesen"
  When I fill in "logpassid" with "pass1234"
  When I press "submit"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "efriesen" profile page
  And I should not be on a candidate profile page

Scenario: invalid username and valid password for candidate
  When I fill in "loguserid" with "efreise"
  When I fill in "logpassid" with "secure!p@ss"
  When I press "submit"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "efriesen" profile page
  And I should not be on a candidate profile page

Scenario: invalid username and valid password for recruiter
  When I fill in "loguserid" with "fluffyBunnys"
  When I fill in "logpassid" with "pass1234"
  When I press "submit"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "fluffyBunnies" profile page
  And I should not be on a recruiter profile page

