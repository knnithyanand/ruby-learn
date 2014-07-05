Feature: Folder
  In order to create folder
  As a user
  I want to create a new folder
  
  Scenario: Create  Folder
    Given I have folders called "Team 1", "My Team 2"
    When I go to the list of folders
    Then I should see "Team 1"
    And I should see "My Team 2"