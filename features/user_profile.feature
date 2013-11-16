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

Scenario:  recruiters should be able to see their events
  Given I am on the "fluffyBunnies" recruiters page
  When I create an event "GoogleInterview" at "10/10/10"
  Then I should see the event on my feed

Scenario:  candidates should be able to edit their information
  Given I am logged in as "nestorga" with password "fooPass3"
  And I am on the "nestorga" candidates page
  When I press "Edit"
  Then I am on the edit page for candidate "nestorga"

Scenario:  candidates should be able to change their password
  Given I am logged in as "nestorga" with password "fooPass3"
  And I am on the "nestorga" candidates page
  And I am on the edit page for candidate "nestorga"
  When I fill in "candidate_password" with "abcde"
  And I press "Update"
  Then I should be on the "nestorga" candidates page
  And the password for "nestorga" should be "abcde"

Scenario: candidates should be able to change their email
  Given I am logged in as "nestorga" with password "fooPass3"
  And I am on the "nestorga" candidates page
  And I am on the edit page for candidate "nestorga"
  When I fill in "candidate_email" with "new_email@gmail.com"
  And I press "Update"
  Then I should be on the "nestorga" candidates page
  And the email for "nestorga" should be "new_email@gmail.com"

  Scenario:  recruiters should be able to edit their information
  Given I am logged in as "fluffyBunnies" with password "pass1234"
  And I am on the "fluffyBunnies" recruiters page
  When I press "Edit"
  Then I am on the edit page for recruiter "fluffyBunnies"

Scenario:  recruiters should be able to change their password
  Given I am logged in as "fluffyBunnies" with password "pass1234"
  And I am on the "fluffyBunnies" recruiters page
  Given I am on the edit page for recruiter "fluffyBunnies"
  When I fill in "recruiter_password" with "anewpass"
  And I press "Update"
  Then I should be on the "fluffyBunnies" recruiters page
  And the password for "fluffyBunnies" should be "anewpass"

Scenario: recruiters should be able to change their email
  Given I am logged in as "fluffyBunnies" with password "pass1234"
  And I am on the "fluffyBunnies" recruiters page
  Given I am on the edit page for recruiter "fluffyBunnies"
  When I fill in "recruiter_email" with "wtf@yahoo.com"
  And I press "Update"
  Then I should be on the "fluffyBunnies" recruiters page
  And the email for "fluffyBunnies" should be "wtf@yahoo.com"