Feature: Insite messaging

  As a user
  So that we can have communication done completely through the website
  I want to be able to send messages through a website messaging system


Background: the user accounts exist


Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |


@javascript
Scenario: Sent messages from a user is seen in the outbox
Given I am logged in as "fluffyBunnies" with password "pass1234"
And I am on the "fluffyBunnies" recruiters page
When I follow "mailbox"
And I press "compose_button"
And I fill in "title" with "TestMsg"
And I fill in "to" with "nestorga"
And I fill in "content" with "blahdy blahdy blah"
And I press "submit"
And I follow "Outbox"
Then I should see "TestMsg"
And I should see "nestorga"


@javascript
Scenario: Sent messages from a user is seen in recipient's inbox
Given I am logged in as "fluffyBunnies" with password "pass1234"
And I am on the "fluffyBunnies" recruiters page
When I follow "mailbox"
And I press "compose_button"
And I fill in "title" with "TestMsg"
And I fill in "to" with "nestorga"
And I fill in "content" with "blahdy blahdy blah"
And I press "submit"
And I follow "Logout"
And I fill in "userid" with "nestorga"
And I fill in "password" with "fooPass3"
And I press "Login"
Then I should be on the "nestorga" candidates page
When I follow "mailbox"
Then I should see "TestMsg"
And I should see "fluffyBunnies"