Feature: allow users to view events and edit their profile

  As an active user
  So that I can edit my profile information
  I want to be able to edit my profile after I've signed up

Background: the user's account does not already exist

  Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |

  And I am on the "nestorga" candidates page


Scenario:  users should be able to change their password
  When I click the edit button
  Then I am on an edit page
  When I fill in the edit field for password with "abcde"
  Then my password is "abcde"


Scenario:  recruiters should be able to see their events
  Given I am on "fluffyBunnies" recruiters page
  When I create an event "GoogleInterview" at "10/10/10"
  Then I should see the event on my feed


Scenario: users should be able to change their email
  When I click the edit button
  Then I am on an edit page
  When I fill in the field for email with "new_email@gmail.com"
  Then my email is "new_email@gmail.com"