Feature: Allow users who have forgotten their passwords to get new passwords

  As an end user
  So that I can access my profile when I forget my password
  I want to be able to login and view my account's profile

Background: The user's account already exists
    Given the following accounts exist:
    | username      | email                       | password |
    | fluffyBunnies | fluffyBunnies@recruiter.com | pass1234 |
    | nestorga      | foo@candidate.com           | f00p@ss! |

    And I am on the InterviewScheduler home page

Scenario: I forget my password and want to reset it
  When I follow "Forgot your password?"
  Then I should be on the ForgotPassword page
  When I fill in "email" with "fluffyBunnies@recruiter.com"
  And I press "Retrieve"
  Then I should be on the InterviewScheduler home page

Scenario: I am not a user and try to reset my password
  Given I am on the ForgotPassword page
  When I fill in "email" with "false@candidate.com"
  And I press "Retrieve"
  Then I should be on the InterviewScheduler homepage
