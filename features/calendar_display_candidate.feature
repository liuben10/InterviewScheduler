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
  | recruiter_id        | name          | pending_id     | start_at | end_at |
  | fluffyBunnies   | Wrecruiter     | nestorga      | 2013-12-13   |2013-12-13   |
  | fluffyBunnies   | arecruiter     | efriesen      | 2013-12-12   |2013-12-12   |
  | radhesh         | brecruiter     | some_cand     | 2013-12-14   |2013-12-14   |
  | radhesh         | crecruiter     | nestorga      | 2013-12-08   |2013-12-08   |
  | nestorga        | dcandidate     | fluffyBunnies | 2013-12-13   |2013-12-13   |
  | nestorga        | erecruiter     | radhesh       | 2013-12-08   |2013-12-08   |
  | efriesen        | fcandidate     | fluffyBunnies | 2013-12-12   |2013-12-12   |
  | some_cand       | gcandidate     | radhesh       | 2013-12-14   |2013-12-14   |

  And I am logged in as "nestorga" with password "fooPass3"

@javascript
Scenario: Display upcoming appointments
  Then I should see an appointment with "fluffyBunnies" on "2013/13/13"
  And I should see an appointment with "radhesh" on "2013/12/08"

@javascript
Scenario: Don't display appointments candidate doesn't have
  Then I should not see an appointment with "radhesh" on "2013/12/11"
  And I should not see an appointment with "fluffyBunnies" on "2013/12/12"
  And I should not see an appointment with "radhesh" on "2013/12/14"

@javascript
Scenario: Don't display appointments of other candidates
  And I should not see an appointment with "fluffyBunnies" on "12/25/12"
  And I should not see an appointment with "radhesh" on "03/02/14"

@javascript
Scenario: Don't display appointments of recruiters
  Then I should not see an appointment with "some_cand" on "03/02/14"
  And I should not see an appointment with "efriesen" on "12/25/12"
  And I should not see an appointment with "nestorga" on "10/03/13"
  And I should not see an appointment with "nestorga" on "07/27/08"
