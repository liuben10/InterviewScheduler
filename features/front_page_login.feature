Feature: allow users to login to their accounts

  As an end user
  So that I can view information related to my account
  I want to be able to login and view my acconut profile

Background: the user's account already exists

  Given the following accounts exist:
  | username       | email                 | password          | type       |
  | fluffyBunnies  | fluffyBunnies         | pass1234          | recruiter  |
  | nestorga       | nestorga              | fooPass3          | candidate  |
  | efriesen       | efriesen              | secure!p@ss       | candidate  |

  And I am on the InterviewScheduler homepage


Scenario: valid username and password for recruiter
  When I fill in "userid" with "fluffyBunnies"
  When I fill in "passid" with "pass1234"
  When I press "Login"
  Then I should be on the "fluffyBunnies" recruiters page
  And I should not be on the InterviewScheduler home page


Scenario: valid username and password for candidate
  When I fill in "userid" with "nestorga"
  When I fill in "passid" with "fooPass3"
  When I press "Login"
  Then I should be on the "nestorga" candidates page
  And I should not be on the InterviewScheduler home page


Scenario: valid username and invalid password for recruiter
  When I fill in "userid" with "fluffyBunnies"
  When I fill in "passid" with "secure!p@ss"
  When I press "Login"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "fluffyBunnies" recruiters page


Scenario: valid username and invalid password for candidate
  When I fill in "userid" with "efriesen"
  When I fill in "passid" with "pass1234"
  When I press "Login"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "efriesen" candidates page
 


Scenario: invalid username and valid password for candidate
  When I fill in "userid" with "efreise"
  When I fill in "passid" with "secure!p@ss"
  When I press "Login"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "efriesen" candidates page



Scenario: invalid username and valid password for recruiter
  When I fill in "userid" with "fluffyBunnys"
  When I fill in "passid" with "pass1234"
  When I press "Login"
  Then I should be on the InterviewScheduler home page
  And I should not be on the "fluffyBunnies" recruiters page


Scenario: after logging in, the home page should redirect to the candidate's profile page
  When I fill in "userid" with "nestorga"
  When I fill in "passid" with "fooPass3"
  When I press "Login"
  And I follow "Interview Scheduler"
  Then I should be on the "nestorga" candidates page
  And I should not be on the InterviewScheduler home page

Scenario: after logging in, the home page should redirect to the recruiter's profile page
  When I fill in "userid" with "fluffyBunnies"
  When I fill in "passid" with "pass1234"
  When I press "Login"
  And I follow "Interview Scheduler"
  Then I should be on the "fluffyBunnies" recruiters page
  And I should not be on the InterviewScheduler home page
 