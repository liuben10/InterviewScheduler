Feature: Allow users to logout

  As a user,
  So I can switch accounts during a session,
  I should be able to logout from any page

Background: the user is already logged in

  Given the following accounts exist:
  | username       | email                 | password          | type       |
  | fluffyBunnies  | fluffyBunnies         | pass1234          | recruiter  |
  | nestorga       | nestorga              | fooPass3          | candidate  |
  | efriesen       | efriesen              | secure!p@ss       | candidate  |

  And I am logged in as "fluffyBunnies" with password "pass1234"
  And I am on the "fluffyBunnies" recruiters page

@javascript
Scenario: Should sign out of account when "Logout" is pressed
	When I follow "Logout"
	Then I should be on the InterviewScheduler homepage
	And I should not see "Logout"
