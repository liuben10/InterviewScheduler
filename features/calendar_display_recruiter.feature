Feature: display a calendar of appointments for recruiters

As a recruiter
So that I can view my appointments with candidates
I want to see a calendar of my appointments on my profile page

Background: the recruiter's account already exists and there are scheduled appointments

Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | radhesh               | lamepass101		    | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |
  | some_cand             | hello321		      | candidate  |

  And the following appointments exist:

  | username        | type			    | meet_with  		| date       |
  | fluffyBunnies   | recruiter		  | nestorga   		| 10/03/13   |
  | fluffyBunnies   | recruiter     | efriesen   		| 12/25/12   |
  | radhesh         | recruiter		  | some_cand  		| 03/02/14   |
  | radhesh         | recruiter 		| nestorga		  | 07/27/08   |
  | nestorga        | candidate		  | fluffyBunnies	| 10/03/13	 |
  | nestorga        | recruiter     | radhesh	      | 07/27/08   |
  | efriesen        | candidate		  | fluffyBunnies	| 12/25/12   |
  | some_cand       |	candidate		  | radhesh			  | 03/02/14	 |

  And I am on the "fluffyBunnies" profile page

Scenario: Display upcoming appointments
  Then I should see an appointment with "nestorga" on "10/03/13"
  And I should see an appointment with "efriesen" on "12/25/12"

Scenario: Don't display appointments recruiter doesn't have
  Then I should not see an appointment with "some_cand" on "01/05/11"
  And I should not see an appointment with "nestorga" on "02/02/02"
  And I should not see an appointment with "efriesen" on "09/11/19"

Scenario: Don't display appointments of other recruiters
  Then I should not see an appointment with "some_cand" on "03/02/14"
  And I should not see an appointment with "nestorga" on "07/27/08"

Scenario: Don't display appointments of candidates
  And I should not see an appointment with "fluffyBunnies" on "10/03/13"
  And I should not see an appointment with "fluffyBunnies" on "12/25/12"
  And I should not see an appointment with "radhesh" on "07/27/08"
  And I should not see an appointment with "radhesh" on "03/02/14"

