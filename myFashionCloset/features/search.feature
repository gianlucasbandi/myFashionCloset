Feature: User can search creators by username

    As a USER
    I want to SEARCH CREATORS BY THEIR USERNAME
    so that I can SEE THE RESULT LIST

Scenario: User search a creator
    Given I am on the home page
    When I go to the search page
    And I fill in "search-input" with "Tia"
    Then I should see the results