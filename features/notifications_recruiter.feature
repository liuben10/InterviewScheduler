Feature: display notifications for recruiters

As a recruiter
So that I can see that a candidate has accepted my invitation to an event
I want to receive a notification 

Background: the recruiter's account already exists

  Given the following accounts exist:
  | username | password | type      |
  | tien     | 1234     | recruiter |
  | bonghyun | 12345    | candidate |

  And the following events exist:
 | recruiter_id | name       | pending_id | start_at   | end_at     |
 | tien         | TestEvent1 | bonghyun   | 2013-12-23 | 2013-12-23 |
 | tien         | TestEvent2 | bonghyun   | 2013-12-25 | 2013-12-25 |

  And I am logged in as "bonghyun" with password "12345"
  And I am looking at "bonghyun" calendar page
  And I am looking at "TestEvent1" event page as "bonghyun"
  And I press "acceptbutton"
  And I follow "Logout"
  And I am on the InterviewScheduler homepage
  And I am logged in as "tien" with password "1234"
  And I am on the "tien" recruiters page

Scenario: Notifications exist
  Then I should see "Notifications"

Scenario: Candidate accepts event invitation
  Then I should see "bonghyun has accepted your event invitation"

Scenario: Candidate declines event invitation
  Then I should see "bonghyun has declined your event invitation" 

Scenario: Candidate does not respond to invitation to event
  Then I should not see "bonghyun has accepted your event invitation"
  Then I should not see "bonghyun has declined your event invitation"









