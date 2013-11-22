Feature: display up to five upcoming appointments for users

As a user
So that I can quickly check out my upcoming events
My profile page should have a dashboard, which includes a list
of up to five upcoming events, sorted by earliest date

Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | radhesh               | lamepass101       | recruiter  |
  | some_recr             | hello321          | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |
  

  And the following appointments exist:
  | username        | type          | meet_with     | date       |
  | nestorga        | candidate     | fluffyBunnies | 10/03/13   |
  | nestorga        | candidate     | radhesh       | 12/25/12   |
  | nestorga        | candidate     | some_recr     | 07/27/08   |
  | nestorga        | candidate     | some_recr     | 03/02/14   |
  | nestorga        | candidate     | some_recr     | 06/20/21   |
  | nestorga        | candidate     | some_recr     | 10/29/19   |

  And I am logged in as "nestorga"
  And I am on the "nestorga" profile page
 
  Scenario: Display next five appointments in order from earliest to latest
    Then I should see an appointment with "fluffyBunnies" on "10/03/13" before "radhesh" on "12/25/12"
    And I should see an appointment with "radhesh" on "12/25/12" before "some_recr" on "07/27/08"
    And I should see an appointment with "some_recr" on "07/27/08" before "some_recr" on "03/02/14"
    And I should see an appointment with "some_recr" on "03/02/14" before "some_recr" on "10/29/19"
    And I should see an appointment with "some_recr" on "10/29/19"

  Scenario: Don't display more than five appointments
    Then I should not see an appointment with "some_recr" on "06/20/21" 