 Feature: add events for recruiters

As a recruiter
So that I add events
I want to be able to click on a date and add events

Background: the recruiter's account already exists and there are scheduled appointments

Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | radhesh               | lamepass101       | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |
  | some_cand             | hello321          | candidate  |

 And I am logged in as "fluffyBunnies" with password "pass1234"
  And I am looking at "fluffyBunnies" calendar page
  
@javascript
Scenario: Add events as recruiter
  When I add an event "InterviewTest1" with candidate "nestorga" starting at "2013-12-15" and ending at "2013-12-15"
  Then I should see the event "InterviewTest1" in my events table
  When I am looking at "fluffyBunnies" calendar page
  Then I should see "InterviewTest1"