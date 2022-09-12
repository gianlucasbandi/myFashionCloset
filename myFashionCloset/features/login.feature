Feature: User can access with his account
  AS a User
  I want to enter my email
  so I can access the site 

Scenario: Log in success
  Given I am on the log in page
  And I am a registred user
  When I fill in "email" with "ale@gmail.com"
  And I fill in "password" with "Alessia.2001"
  And I press the button "login"
  I should be on the homepage

