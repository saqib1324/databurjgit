Feature: Login to databurj
 
  As an admin
  So that I can use databurj
  I want to login to databurj
  
Scenario: Login to databurj with valid user id and password
  Given I should be at the Login page
  When I fill in "Username" with "databurj"
  And I fill in "Password" with "windows787!"
  And I click on "Log In"
  Then I should see the title "databurjproject"