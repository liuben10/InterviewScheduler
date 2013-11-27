Feature: display a calendar of appointments for candidates

As a candidate
So that I can view my appointments with recruiters
I want to see a calendar of my appointments on my profile page

Background: the candidate's account already exists and there are scheduled appointments

Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | radhesh               | lamepass101       | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |
  | some_cand             | hello321          | candidate  |

  And the following events exist:
  | recruiter_id        | name          | pending_id     | start_at       |
  | fluffyBunnies   | Wrecruiter     | nestorga      | 10/03/13   |
  | fluffyBunnies   | arecruiter     | efriesen      | 12/25/12   |
  | radhesh         | brecruiter     | some_cand     | 03/02/14   |
  | radhesh         | crecruiter     | nestorga      | 07/27/08   |
  | nestorga        | dcandidate     | fluffyBunnies | 10/03/13   |
  | nestorga        | erecruiter     | radhesh       | 07/27/08   |
  | efriesen        | fcandidate     | fluffyBunnies | 12/25/12   |
  | some_cand       | gcandidate     | radhesh       | 03/02/14   |

  And I am logged in as "nestorga" with password "fooPass3"

Scenario: Display upcoming appointments
  Then I should see an appointment with "fluffyBunnies" on "10/03/13"
  And I should see an appointment with "radhesh" on "07/27/08"

Scenario: Don't display appointments candidate doesn't have
  Then I should not see an appointment with "radhesh" on "01/05/11"
  And I should not see an appointment with "fluffyBunnies" on "02/02/02"
  And I should not see an appointment with "radhesh" on "09/11/19"

Scenario: Don't display appointments of other candidates
  And I should not see an appointment with "fluffyBunnies" on "12/25/12"
  And I should not see an appointment with "radhesh" on "03/02/14"

Scenario: Don't display appointments of recruiters
  Then I should not see an appointment with "some_cand" on "03/02/14"
  And I should not see an appointment with "efriesen" on "12/25/12"
  And I should not see an appointment with "nestorga" on "10/03/13"
  And I should not see an appointment with "nestorga" on "07/27/08"
