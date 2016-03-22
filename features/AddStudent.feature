Feature: Add new Student to Students table in database
 
  As an admin
  So that I can apply different features on this Student
  I want to add new Student to the Students table

Background: some Students have been added to the Students table

    Given the following Students exist:
    | id | name  | tracking_id  | father_name | DOB        | SEX  | city   | email               | phone_number | mailing_address |
    |  1 | saqib | 111          | sadiq       | 02-03-45   | M    | lahore | rtyrtrt.rt@dsft.drf | 45645        | fd af afdrfdaf  |
    
    And I am on the New Student page
    
Scenario: Add new student
  # Given I am on the Students home page
  Given I am on the New Student page
  # When I follow "Add Students"?;
  # Then I should be on the New Student page
  When I fill in "Tracking id" with "9978"
  And I fill in "Name" with "sohail"
  And I fill in "father_name" with "asdf"
  And I fill in "DOB" with "02-03-45"
  And I fill in "Sex" with "M"
  And I fill in "city" with "lahore"
  And I fill in "email" with "Saqib@mail.com"
  And I fill in "phone_number" with "03128574459"
  And I fill in "mailing_address" with "asdfasdf asdfae"
  And I press "Create Student"
  Then I should be on the Students home page
  And I should see "sohail"