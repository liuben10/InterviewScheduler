Feature: add candidates to list of interviewees

As a recruiter
So that I can add candidates to my interviewing list
I should be able to add candidates using their username

Background:

  Given the following accounts exist:
    | username              | password          | type       | email                      | name       |
    | fluffyBunnies         | pass1234          | recruiter  | bunnies@fluffy.com         | Mr.Bunny   |
    | nestorga              | fooPass3          | candidate  | nestorga@cs.com            | Nick       |
    | efriesen              | secure!p@ss       | candidate  | efriesen@cs.com            | Erin       |
    | rottenPotatoes        | notGood           | candidate  | rottenPotatoes@movies.com  | Mr.Potato  |
    | joeSchmoe             | testPass          | candidate  | joeSchmoe@bum.com          | Joe Schmoe |
    | penelope              | 456pass           | candidate  | penelope@cruz.com          | Penelope   |

  And I am logged in as "fluffyBunnies" with password "pass1234"


Scenario: Enter a valid candidate username
  When I press the list icon
  And I fill in "candidate_username" with "joeSchmoe"
  And I press "Add"
  Then I should see candidate "joeSchmoe" with the email "joeSchmoe@bum.com" and the name "Joe Schmoe"

Scenario: Enter an invalid candidate username
  When I press the list icon
  And I fill in "candidate_username" with "huehuehue"
  And I press "Add"
  Then I should see "Could not find the candidate with that username"
