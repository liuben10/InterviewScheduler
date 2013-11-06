Feature: Allow recruiters to see list of candidates reviewing

	As a recruiter
	So that I can view a list of candidates currently in the process of interviewing
	I want to see the list of candidates and their progress on my front page

Background: the recruiter has the following candidates

	Given the following accounts exist:
	  | username              | password          | type       |
  	  | fluffyBunnies         | pass1234          | recruiter  |
	  | nestorga              | fooPass3          | candidate  |
	  | efriesen              | secure!p@ss       | candidate  |
	  | rottenPotatoes	  | notGood	      | candidate  |
	  | joeSchmoe		  | testPass	      | candidate  |
          | penelope              | 456pass           | candidate  |

	Given the following information of the candidates:
	  | username              | email 		| status      |
	  | nestorga              | foo@candidate.com	| New         |
	  | efriesen              | bar@candidate.com   | In Progress |
	  | rottenPotatoes	  | spuds@candidate.com | Rejected    |
	  | joeSchmoe		  | joe@candidate.com   | In Progress |
          | penelope		  | pens@candidate.com  | Hired       |

	And I am on the "fluffyBunnies" recruiter page

Scenario: check to see the status of all the candidates
	When I check "all_candidates"
	Then I should see the candidate "nestorga" with the status "New"
	And I should see the candidate "efriesen" with the status "In Progress"
	And I should see the candidate "rottenPotatoes" with the status "Rejected"
	And I should see the candidate "penelope" with the status "Hired"
	And I should see the candidate "joeSchmoe" with the status "In Progress"
	And I should see the candidate "nestorga" with the email "foo@candidate.com"
	And I should see the candidate "efriesen" with the email "bar@candidate.com"
	And I should see the candidate "rottenPotatoes" with the email "spuds@candidate.com"
	And I should see the candidate "penelope" with the email "pens@candidate.com"
	And I should see the candidate "joeSchmoe" with the email "joe@candidate.com"

Scenario: check the status of all the "In Progress" candidates
	When I check "In_Progress"
	Then I should see the candidate "efriesen" with the status "In Progress"
	And I should see the candidate "efriesen" with the email "bar@candidate.com" 
	Then I should see the candidate "joeSchmoe" with the status "In Progress"
	And I should see the candidate "joeSchmoe" with the email "joe@candidate.com" 
	And I should not see "nestorga"
	And I should not see "rottenPotatoes"
	And I should not see "penelope"

Scenario: check the status of all the "Rejected" candidates
	When I check "rejected"
	Then I should see the candidate "rottenPotatoes" with the status "Rejected"
	And I should see the candidate "rottenPotatoes" with the email "spuds@candidate.com" 
	And I should not see "nestorga"
	And I should not see "penelope"
	And I should not see "efriesen"
	And I should not see "joeSchmoe"

Scenario: check the status of all the "Hired" candidates
	When I check "Hired"
	Then I should see the candidate "penelope" with the status "Hired"
	And I should see the candidate "penelope" with the email "pens@candidate.com" 
	And I should not see "nestorga"
	And I should not see "rottenPotatoes"
	And I should not see "efriesen"
	And I should not see "joeSchmoe"
	
	
