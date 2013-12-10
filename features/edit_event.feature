 Feature: Edit Events for Recruiters
As a recruiter
So that I can edit events after I've submitted them
I want to be able to Edit Events

Background: Following users exists as well as events.


Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | radhesh               | lamepass101       | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |
  | some_cand             | hello321          | candidate  |

And the following events exist:

 | recruiter_id  |  name     | pending_id | start_at   | end_at    |
 | fluffyBunnies | TestEdit | nestorga   |  2013-12-2 | 2013-12-2 |
 | fluffyBunnies | TestDelete | nestorga | 2013-12-2  | 2013-12-2 |

And I am logged in as "fluffyBunnies" with password "pass1234"

@javascript
Scenario: Add an event description
When I am looking at "TestEdit" event page as "recruiter"
And I fill in "description" with "Hello World!"
And I press "Update"
Then  "TestEdit" should have "Hello World!" as description

@javascript
Scenario: Delete event from table
When I am looking at "TestDelete" event page as "recruiter"
And I press "Delete"
Then "TestDelete" does not exist

@javascript
Scenario: Navigate to the edit page
Given I am looking at "fluffyBunnies" calendar page
When I click on an event "TestEdit"