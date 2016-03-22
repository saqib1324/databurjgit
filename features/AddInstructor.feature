Feature: Add new Instructor to Instructors table in database
 
  As an admin
  So that I can apply different features on this instructor
  I want to add new instructor to the Instructors table

Background: some instructors have been added to the Instructors table

    Given the following instructors exist:
    | id | instructor_id | instructor_name | email            | subject_name |
    |  1 | 434           | sd              | sd@kl.com        | sd           |
    |  2 | 1             | Alvi            | alvi@lums.edu.pk | punjabi      |
    |  3 | 2             | bean            | bean@lums.edu.pk | sindhi       |
    |  4 | 3             | butt            | butt@lums.edu.pk | balochi      |
    |  5 | 4             | lol             | lol@lums.edu.pk  | pushto       |
    
    And I am on the Databurj home page
    
Scenario: Add new instructor
  Given I am on the Databurj home page
  When I follow "Add Instructors"
  Then I should be on Create New Instructor page
  When I fill in "Instructor id" with "9978"
  And I fill in "Name" with "Saqib"
  And I fill in "Mail" with "Saqib@mail.com"
  And I fill in "Subject" with "English"
  And I press "Create Instructor"
  Then I should be on View Instructors page