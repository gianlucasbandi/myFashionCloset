Feature: User can change his personal info
    As a USER
    I want to HAVE A PERSONAL PROFILE
    so that I CAN CHANGE MY USERNAME AND AVATAR

Background:
    Given I am a registered user
    When I login

Scenario: User change only username
    When I go to the personalInfo page
    And I fill in "usernameInput" with "changeUsername"
    And I press "updateSubmit"
    Then I should be on the home page
    And I should see "Profile updated "

Scenario: User change only avatar
    When I go to the personalInfo page
    And I attach the file "foto.png" to "user_avatar"
    And I press "updateSubmit"
    Then I should be on the home page
    And I should see "Profile update"

Scenario: User change avatar and username
    When I go to the personalInfo page
    And I fill in "usernameInput" with "changeUsername"
    And I attach the file "foto.png" to "user_avatar"
    And I press "updateSubmit"
    Then I should be on the home page
    And I should see "Profile update"