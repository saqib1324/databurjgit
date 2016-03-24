Feature: Add new Section to Sections table in database
 
  As an admin
  So that I can apply different features on this section
  I want to add new Section to the Sections table

Background: some Sections have been added to the Sections table

    Given the following sections exist:
    | id | section_id    | section_name    | instructor_id   |
    |  1 | 4             | SectionA         | 98           |
    
    
Scenario: Add new instructor
  Given I am on the New Section page
  When I fill in "section_section_id" with "5"
  And I fill in "section_section_name" with "SectionB"
  And I fill in "section_instructor_id" with "99"
  And I press "Create Section"
  Then I should be on the Sections home page
  And I should see "SectionB"