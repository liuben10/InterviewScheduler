Feature: add candidates to list of interviewees

As a recruiter
So that I can add candidates to my interviewing list
I should be able to add candidates using their email address

Background:

  Given the following accounts exist:
    | username              | password          | type       | email
    | fluffyBunnies         | pass1234          | recruiter  | bunnies@fluffy.com
    | nestorga              | fooPass3          | candidate  | nestorga@cs.com
    | efriesen              | secure!p@ss       | candidate  | efriesen@cs.com
    | rottenPotatoes        | notGood           | candidate  | rottenPotatoes@movies.com
    | joeSchmoe             | testPass          | candidate  | joeSchmoe@bum.com
    | penelope              | 456pass           | candidate  | penelope@cruz.com

  And I am on the "fluffyBunnies" recruiter page

Scenario: Enter a valid candidate email address
  When I fill in "candidate_email" with "joeSchmoe@bum.com"
  And I press "Add"
  And I check "all_candidates"
  Then I should see the candidate "joeSchmoe" with the status "New"

Scenario: Enter an invalid candidate email address
  When I fill in "candidate_email" with "huehuehue@br.com"
  And I press "Add"
  Then I should see "Error, candidate not found"