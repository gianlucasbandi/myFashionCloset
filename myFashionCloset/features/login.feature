Feature: User can access with his account
  As a USER
  I want to LOGIN WITH EMAIL
  so that I can use all features 

Scenario: Login success
  Given I am on the login page
  And I am a registered user
  When I fill in "email" with "mattia@prova.it"
  And I fill in "password" with "password"
  And I press "login"
  Then I should be on the home page


Scenario: Login fail
    Given I am on the login page
    When I fill in "email" with "notRegistered@test.it"
    And I fill in "password" with "notRegisteredPassword"
    And I press "login"
    Then I should be on the login page
    And I should see "Invalid Email or password."