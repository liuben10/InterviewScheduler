 Feature: accept invitations for candidates
As a candidate
So that I can confirm interview timeslots
I want to be able to accept interview invitations.

Background: Following candidates exist as well as a pending invitation.

Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | radhesh               | lamepass101       | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |
  | some_cand             | hello321          | candidate  |

And the following events exist:

 | recruiter_id  |  name     | pending_id | start_at   | end_at    |
 | fluffyBunnies | TestEvent | nestorga   |  2013-12-2 | 2013-12-2 |

And I am logged in as "nestorga" with password "fooPass3"
And I am looking at "nestorga" calendar page

@javascript
Scenario: Accepting invitation
When I am looking at "TestEvent" event page as "nestorga"
And I press "acceptbutton"
Then event "TestEvent" should have "nestorga" as accepted
