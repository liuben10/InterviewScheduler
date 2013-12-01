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
  | recruiter_id    | name          | pending_id       | start_at   |  end_at  |
  | fluffyBunnies   | lovefest1     | nestorga         | 2013-12-13   | 2013-12-13 |
  | fluffyBunnies   | lovefest2     | efriesen         | 2013-12-12   | 2013-12-12 |
  | radhesh         | lovefest3     | some_cand        | 2013-12-14   | 2013-12-14 |
  | radhesh         | gamingfest1   | nestorga         | 2013-12-08   | 2013-12-08 |
  | nestorga        | gamingfest2   | fluffyBunnies    | 2013-12-13   | 2013-12-13 |
  | nestorga        | lanparty1     | radhesh          | 2013-12-08   | 2013-12-08 |
  | efriesen        | lanparty2     | fluffyBunnies    | 2013-12-12   | 2013-12-12 |
  | some_cand       | lanparty3     | radhesh          | 2013-12-14   | 2013-12-14 |
 And I am logged in as "fluffyBunnies" with password "pass1234"

Scenario: Display upcoming appointments
  Then I should see an appointment with "nestorga" on "12/13/13"
  And I should see an appointment with "efriesen" on "12/12/13"

Scenario: Don't display appointments recruiter doesn't have
  Then I should not see an appointment with "some_cand" on "12/05/13"
  And I should not see an appointment with "nestorga" on "12/02/13"
  And I should not see an appointment with "efriesen" on "12/11/13"

Scenario: Don't display appointments of other recruiters
  Then I should not see an appointment with "some_cand" on "12/02/13"
  And I should not see an appointment with "nestorga" on "12/27/13"

Scenario: Don't display appointments of candidates
  And I should not see an appointment with "fluffyBunnies" on "12/03/13"
  And I should not see an appointment with "fluffyBunnies" on "12/25/13"
  And I should not see an appointment with "radhesh" on "12/27/13"
  And I should not see an appointment with "radhesh" on "12/02/13"

