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
  

  And the following appointments exist:
  | username        | acc_type      | meet_with     | date       |
  | nestorga        | candidate     | fluffyBunnies | 2013-10-03 |
  | nestorga        | candidate     | radhesh       | 2012-12-25 |
  | nestorga        | candidate     | some_recr     | 2008-07-27 |
  | nestorga        | candidate     | some_recr     | 2014-03-02 |
  
  | nestorga        | candidate     | some_recr     | 2019-10-29 |
  | radhesh         | recruiter     | efriesen      | 2016-08-10 |
  | radhesh         | recruiter     | nestorga      | 2012-12-25 |
  | radhesh         | recruiter     | some_cand     | 2000-11-13 |
  | radhesh         | recruiter     | some_cand     | 2014-02-20 |
  
  | radhesh         | recruiter     | some_cand     | 2019-12-07 |

 
  Scenario: Display next five appointments in order from earliest to latest for candidates
    Given I am logged in as "nestorga" with password "fooPass3"
    And I am on the "nestorga" candidates page
    Then I should see the appointment with "some_recr" on "07/27/08" before "radhesh" on "12/25/12"
    And I should see the appointment with "radhesh" on "12/25/12" before "fluffyBunnies" on "10/03/13"
    And I should see the appointment with "fluffyBunnies" on "10/03/13" before "some_recr" on "03/02/14"
    And I should see the appointment with "some_recr" on "03/02/14" before "some_recr" on "10/29/19"
    And I should see an appointment with "some_recr" on "10/29/19"

  Scenario: Don't display more than five appointments for candidates
    Given I am logged in as "nestorga" with password "fooPass3"
    And I am on the "nestorga" candidates page
    Then I should not see an appointment with "some_recr" on "06/20/21" 

  Scenario: Display next five appointments in order from earliest to latest for recruiters
    Given I am logged in as "radhesh" with password "lamepass101"
    And I am on the "radhesh" recruiters page
    Then I should see the appointment with "some_cand" on "11/13/00" before "nestorga" on "12/25/12"
    And I should see the appointment with "nestorga" on "12/25/12" before "some_cand" on "02/20/14"
    And I should see the appointment with "some_cand" on "02/20/14" before "efriesen" on "08/10/16"
    And I should see the appointment with "efriesen" on "08/10/16" before "some_cand" on "12/07/19"
    And I should see an appointment with "some_cand" on "12/07/19"

  Scenario: Don't display more than five appointments for recruiters
    Given I am logged in as "radhesh" with password "lamepass101"
    And I am on the "radhesh" recruiters page
    Then I should not see an appointment with "some_cand" on "06/14/21" 