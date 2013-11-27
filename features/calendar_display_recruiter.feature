Feature: display a calendar of appointments for recruiters

As a recruiter
So that I can view my appointments with candidates
I want to see a calendar of my appointments on my profile page

Background: the recruiter's account already exists and there are scheduled appointments

Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | radhesh               | lamepass101       | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |
  | some_cand             | hello321          | candidate  |

  And the following events exist:
  | recruiter_id    | name          | pending_id       | start_at   |
  | fluffyBunnies   | lovefest1     | nestorga         | 10/03/13   |
  | fluffyBunnies   | lovefest2     | efriesen         | 12/25/12   |
  | radhesh         | lovefest3     | some_cand        | 03/02/14   |
  | radhesh         | gamingfest1   | nestorga         | 07/27/08   |
  | nestorga        | gamingfest2   | fluffyBunnies    | 10/03/13   |
  | nestorga        | lanparty1     | radhesh          | 07/27/08   |
  | efriesen        | lanparty2     | fluffyBunnies    | 12/25/12   |
  | some_cand       | lanparty3     | radhesh          | 03/02/14   |

  And I am logged in as "fluffyBunnies" with password "pass1234"
  And I am on the "fluffyBunnies" calendar page
  
@javascript
Scenario: Add events as recruiter
  When I add an event "InterviewTest1" starting at "2013,11,11,1,30" and ending at "2013,11,11,2,30"
  Then I should see the event "InterviewTest1" in my events table

Scenario: Display upcoming appointments
  Then I should see an appointment with "nestorga" on "10/03/13"
  And I should see an appointment with "efriesen" on "12/25/12"

Scenario: Don't display appointments recruiter doesn't have
  Then I should not see an appointment with "some_cand" on "01/05/11"
  And I should not see an appointment with "nestorga" on "02/02/02"
  And I should not see an appointment with "efriesen" on "09/11/19"

Scenario: Don't display appointments of other recruiters
  Then I should not see an appointment with "some_cand" on "03/02/14"
  And I should not see an appointment with "nestorga" on "07/27/08"

Scenario: Don't display appointments of candidates
  And I should not see an appointment with "fluffyBunnies" on "10/03/13"
  And I should not see an appointment with "fluffyBunnies" on "12/25/12"
  And I should not see an appointment with "radhesh" on "07/27/08"
  And I should not see an appointment with "radhesh" on "03/02/14"

