Feature: Allow recruiters to see list of recruiters

	As a recruiter
	So that I can view a list of recruiters currently in the process of interviewing with
	I want to be able to access the list of recruiters I'm associated with

Background: the recruiter has the following recruiters

	Given the following accounts exist:
    | username       | password      | type       | email                   | name       |
  	| fluffyBunnies  | pass1234      | recruiter  | foo@recruiter.com       | Mr.Bunny   |
	| nestorga       | fooPass3      | candidate  | nestorga@candidate.com  | Nick       |
	| efriesen       | secure!p@ss   | recruiter  | bar@recruiter.com       | Erin       |
	| rottenPotatoes | notGood	     | recruiter  | spuds@recruiter.com     | Mr.Potato  |
	| joeSchmoe		 | testPass	     | recruiter  | joe@recruiter.com       | Joe Schmoe |
    | penelope       | 456pass       | recruiter  | pens@recruiter.com      | Penelope   |

    And the candidate "nestorga" is associated with the following recruiters:
    | username       |
    | rottenPotatoes |
    | efriesen       |
    | penelope       |

    And I am logged in as "nestorga" with password "fooPass3"
	And I am on the "nestorga" candidates page

Scenario: Should see list of associated recruiters on recruiter list
	When I press the list icon
	And I should see recruiter "efriesen" with the email "bar@recruiter.com" and the name "Erin"
	And I should see recruiter "rottenPotatoes" with the email "spuds@recruiter.com" and the name "Mr.Potato"
	And I should see recruiter "penelope" with the email "pens@recruiter.com" and the name "Penelope"
	

Scenario: Should not see recruiters that the candidate is not associated with
	When I press the list icon
	Then I should not see recruiter "fluffyBunnies" with the email "foo@recruiter.com" and the name "Mr.Bunny"
	And I should not see recruiter "joeSchmoe" with the email "joe@recruiter.com" and the name "Joe Schmoe"
	
	
