Feature: Allow recruiters to see list of recruiters

	As a recruiter
	So that I can view a list of recruiters currently in the process of interviewing with
	I want to see the list of recruiters and my progress on my front page

Background: the recruiter has the following recruiters

	Given the following accounts exist:
	  | username       | password      | type       |
  	| fluffyBunnies  | pass1234      | recruiter  |
	  | nestorga       | fooPass3      | candidate  |
	  | efriesen       | secure!p@ss   | recruiter  |
	  | rottenPotatoes | notGood	     | recruiter  |
	  | joeSchmoe		   | testPass	     | recruiter  |
    | penelope       | 456pass       | recruiter  |

	Given the following information of the recruiters:
	  | username          | email           		| status      |
	  | fluffyBunnies     | foo@recruiter.com	  | New         |
	  | efriesen          | bar@recruiter.com   | In Progress |
	  | rottenPotatoes	  | spuds@recruiter.com | Rejected    |
	  | joeSchmoe		      | joe@recruiter.com   | In Progress |
    | penelope	    	  | pens@recruiter.com  | Hired       |

	And I am on the "nestorga" candidate page

Scenario: check to see the status of all the recruiters/positions
	When I check "all_positions"
	Then I should see the recruiter "fluffyBunnies" with the status "New"
	And I should see the recruiter "efriesen" with the status "In Progress"
	And I should see the recruiter "rottenPotatoes" with the status "Rejected"
	And I should see the recruiter "penelope" with the status "Hired"
	And I should see the recruiter "joeSchmoe" with the status "In Progress"
	And I should see the recruiter "efriesen" with the email "bar@recruiter.com"
	And I should see the recruiter "rottenPotatoes" with the email "spuds@recruiter.com"
	And I should see the recruiter "penelope" with the email "pens@recruiter.com"
	And I should see the recruiter "joeSchmoe" with the email "joe@recruiter.com"
	And I should see the recruiter "fluffyBunnies" with the email "foo@recruiter.com"

Scenario: check the status of all the "In Progress" recruiters
	When I check "In_Progress"
	Then I should see the recruiter "efriesen" with the status "In Progress"
	And I should see the recruiter "efriesen" with the email "bar@recruiter.com" 
	Then I should see the recruiter "joeSchmoe" with the status "In Progress"
	And I should see the recruiter "joeSchmoe" with the email "joe@recruiter.com" 
	And I should not see "nestorga"
	And I should not see "rottenPotatoes"
	And I should not see "penelope"

Scenario: check the status of all the "Rejected" recruiters
	When I check "Rejected"
	Then I should see the recruiter "rottenPotatoes" with the status "Rejected"
	And I should see the recruiter "rottenPotatoes" with the email "spuds@recruiter.com" 
	And I should not see "nestorga"
	And I should not see "penelope"
	And I should not see "efriesen"
	And I should not see "joeSchmoe"

Scenario: check the status of all the "Hired" recruiters
	When I check "Hired"
	Then I should see the recruiter "penelope" with the status "Hired"
	And I should see the recruiter "penelope" with the email "pens@recruiter.com" 
	And I should not see "nestorga"
	And I should not see "rottenPotatoes"
	And I should not see "efriesen"
	And I should not see "joeSchmoe"
	
	
