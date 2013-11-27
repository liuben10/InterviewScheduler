Feature: add recruiters to list of interviewers

As a candidate
So that I can add recruiters to my interviewer list
I should be able to add recruiters using their username

Background:

  Given the following accounts exist:
    | username              | password          | type       | email                      | name       |
    | fluffyBunnies         | pass1234          | recruiter  | bunnies@fluffy.com         | Mr.Bunny   |
    | nestorga              | fooPass3          | candidate  | nestorga@cs.com            | Nick       |
    | efriesen              | secure!p@ss       | candidate  | efriesen@cs.com            | Erin       |
    | rottenPotatoes        | notGood           | candidate  | rottenPotatoes@movies.com  | Mr.Potato  |
    | joeSchmoe             | testPass          | recruiter  | joeSchmoe@bum.com          | Joe Schmoe |
    | penelope              | 456pass           | recruiter  | penelope@cruz.com          | Penelope   |

  And I am logged in as "nestorga" with password "fooPass3"
  And I am on the "nestorga" candidates page

Scenario: Enter a valid recruiter username
  When I press the list icon
  And I fill in "recruiter_username" with "penelope"
  And I press "Add"
  Then I should see recruiter "penelope" with the email "penelope@cruz.com" and the name "Penelope"

Scenario: Enter an invalid recruiter username
  When I press the list icon
  And I fill in "recruiter_username" with "rottenPotatoes"
  And I press "Add"
  Then I should see "Could not find the recruiter with that username"