 Feature: search for recruiters as candidate
As a candidate
So that I can add associated recruiters
I want to be able to search for recruiters to add to my associations.

Background: Following candidates exist as well as a pending invitation.

Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | radhesh               | lamepass101       | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |
  | some_cand             | hello321          | candidate  |


And I am logged in as "nestorga" with password "fooPass3"
And I am on the "nestorga" candidates page

@javascript
Scenario: Searching for a recruiter
When I press the list icon
And I fill in "keyword" with "radhesh"
And I press "Search"
Then I should see "radhesh"
