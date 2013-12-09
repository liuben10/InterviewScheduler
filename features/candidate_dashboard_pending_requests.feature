Feature: display pending interview requests for candidate

As a candidate
So that I can be reminded/notified of interview requests
My dashboard should include a list of pending interview requests

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
  | name    | pending_id      | recruiter_id  | candidate_id | start_at   |     end_at |
  | a       | nestorga        | fluffyBunnies | nestorga     | 2015-10-03 | 2015-10-03 |
  | b       | nestorga        | radhesh       |              | 2014-12-25 | 2014-12-25 |
  | c       | nestorga        | some_recr     |              | 2014-07-27 | 2014-07-27 |
  | d       | nestorga        | some_recr     | nestorga     | 2016-03-02 | 2016-03-02 |
  | e       | nestorga        | some_recr     |              | 2019-10-29 | 2019-10-29 |
  | f       | nestorga        | some_recr     |              | 2021-06-20 | 2021-06-20 |

  And I am logged in as "nestorga" with password "fooPass3"
  And I am on the "nestorga" candidates page


 
  Scenario: Display pending interview requests 
    Then I should see a pending interview request named "c" with "some_recr" on "07/27/14"
    And I should see a pending interview request named "b" with "radhesh" on "12/25/14"
    And I should see a pending interview request named "e" with "some_recr" on "10/29/19"

  Scenario: Don't display requests that have been accepted
    Then I should not see a pending interview request named "a" with "fluffyBunnies" on "10/03/15"
    And I should not see a pending interview request named "d" with "some_recr" on "03/02/16"