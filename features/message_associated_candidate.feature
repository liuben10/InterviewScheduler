Feature: Allow recruiters to send mail directly to candidates they have assoicated with.

  As a recruiter
  So that I can more easily and accurately send messages to my candidates
  I want a drop-down that lets me select which of my associated candidates to message.

Background: the requisite accounts exist

  Given the following accounts exist:
  | username              | password          | type       |
  | fluffyBunnies         | pass1234          | recruiter  |
  | nestorga              | fooPass3          | candidate  |
  | efriesen              | secure!p@ss       | candidate  |

@javascript
Scenario: associated candidate should appear in list of recipients
  Given I am logged in as "fluffyBunnies" with password "pass1234"
  And I am on the list page for recruiter "fluffyBunnies"
  And candidate "efriesen" is associated
  Then I should see "efriesen" in the list of message recipients

@javascript
Scenario: non-associated candidate should not appear in list of recipients
  Given I am logged in as "fluffyBunnies" with password "pass1234"
  And I am on the list page for recruiter "fluffyBunnies"
  And candidate "efriesen" is associated
  Then I should not see "nestorga" in the list of message recipients

