Feature: upload file as a candidate

As a candidate
So that I can have the latest copy of my resume
I want to upload a file and see it on my profile page

Background: the candidate's account already exists

Given the following accounts exist:
  | username | password | type       |
  | tien     | 1234     | candidate  |

  And I am logged in as "tien" with password "1234"
  And I am on the edit page for candidate "tien"

Scenario: Attachment and Picture option exist
  Then I should see "Attachment"
  And I should see "Picture"

Scenario: File upload
  When I attach the file "/home/saasbook/Desktop/cs169/features/sample_uploads/no-attach.png" to "candidate_attach"
  And I press "Update"
  Then I am on the "tien" candidates page
