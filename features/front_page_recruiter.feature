Feature: Allow recruiters to see list of candidates reviewing

	As a recruiter
	So that I can view a list of candidates currently in the process of interviewing
	I want to see the list of candidates and their progress on my front page

Background: the recruiter has the following candidates

	Given the following accounts exist:
    | username       | password      | type       | email                   | name       |
  	| fluffyBunnies  | pass1234      | recruiter  | foo@recruiter.com       | Mr.Bunny   |
	| nestorga       | fooPass3      | candidate  | nestorga@candidate.com  | Nick       |
	| efriesen       | secure!p@ss   | candidate  | bar@candidate.com       | Erin       |
	| rottenPotatoes | notGood	     | candidate  | spuds@candidate.com     | Mr.Potato  |
	| joeSchmoe		 | testPass	     | candidate  | joe@candidate.com       | Joe Schmoe |
    | penelope       | 456pass       | candidate  | pens@candidate.com      | Penelope   |


	And the recruiter "fluffyBunnies" is associated with the following candidates:
    | username       |
    | rottenPotatoes |
    | joeSchmoe      |
    | nestorga       |

    And I am logged in as "fluffyBunnies" with password "pass1234"
	And I am on the "fluffyBunnies" recruiters page

@javascript
Scenario: Should see list of associated candidates on recruiter list
	When I press the list icon
	Then I should see candidate "joeSchmoe" with the email "joe@candidate.com" and the name "Joe Schmoe"
	And I should see candidate "nestorga" with the email "nestorga@candidate.com" and the name "Nick"
	And I should see candidate "rottenPotatoes" with the email "spuds@candidate.com" and the name "Mr.Potato"

@javascript
Scenario: Should not see recruiters that the candidate is not associated with
	When I press the list icon
	Then I should not see candidate "penelope" with the email "pens@candidate.com" and the name "Penelope"
	And I should not see candidate "efriesen" with the email "bar@recruiter.com" and the name "Erin"
	
	
