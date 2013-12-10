Feature: display up to five upcoming appointments for users

As a user
So that I can quickly check out my upcoming events
My profile page should have a dashboard, which includes a list
of up to five upcoming events, sorted by earliest date

Background:
  Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | radhesh               | lamepass101       | recruiter  |
  | some_recr             | hello321          | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |
  | some_cand             | horriblePass      | candidate  |
  

  And the following events exist:
  | name    | pending_id      | recruiter_id  | start_at   |     end_at |
  | a       | nestorga        | fluffyBunnies | 2015-10-03 | 2015-10-03 |
  | b       | nestorga        | radhesh       | 2014-12-25 | 2014-12-25 |
  | c       | nestorga        | some_recr     | 2014-07-27 | 2014-07-27 |
  | d       | nestorga        | some_recr     | 2016-03-02 | 2016-03-02 |
  | e       | nestorga        | some_recr     | 2019-10-29 | 2019-10-29 |
  | f       | nestorga        | some_recr     | 2021-06-20 | 2021-06-20 |
  | g       | efriesen        | radhesh       | 2016-08-10 | 2016-08-10 |
  | h       | some_cand       | radhesh       | 2014-11-13 | 2014-11-13 |
  | i       | some_cand       | radhesh       | 2021-06-14 | 2021-06-14 |
  | j       | some_cand       | radhesh       | 2015-02-20 | 2015-02-20 |
  | k       | some_cand       | radhesh       | 2019-12-07 | 2019-12-07 |


 @javascript
  Scenario: Display next five appointments in order from earliest to latest for candidates
    Given I am logged in as "nestorga" with password "fooPass3"
    And I am on the "nestorga" candidates page
    Then I should see the appointment with "some_recr" on "07/27/14" before "radhesh" on "12/25/14"
    And I should see the appointment with "radhesh" on "12/25/14" before "fluffyBunnies" on "10/03/15"
    And I should see the appointment with "fluffyBunnies" on "10/03/15" before "some_recr" on "03/02/16"
    And I should see the appointment with "some_recr" on "03/02/16" before "some_recr" on "10/29/19"
    And I should see an appointment with "some_recr" on "10/29/19"

  @javascript
  Scenario: Don't display more than five appointments for candidates
    Given I am logged in as "nestorga" with password "fooPass3"
    And I am on the "nestorga" candidates page
    Then I should not see an appointment with "some_recr" on "06/20/21" 

  @javascript
  Scenario: Display next five appointments in order from earliest to latest for recruiters
    Given I am logged in as "radhesh" with password "lamepass101"
    And I am on the "radhesh" recruiters page
    Then I should see the appointment with "some_cand" on "11/13/14" before "nestorga" on "12/25/14"
    And I should see the appointment with "nestorga" on "12/25/14" before "some_cand" on "02/20/15"
    And I should see the appointment with "some_cand" on "02/20/15" before "efriesen" on "08/10/16"
    And I should see the appointment with "efriesen" on "08/10/16" before "some_cand" on "12/07/19"
    And I should see an appointment with "some_cand" on "12/07/19"

  @javascript
  Scenario: Don't display more than five appointments for recruiters
    Given I am logged in as "radhesh" with password "lamepass101"
    And I am on the "radhesh" recruiters page
    Then I should not see an appointment with "some_cand" on "06/14/21" 