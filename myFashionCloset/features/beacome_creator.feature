Feature: User can ask to become creator
    As a USER
    I want to MAKE A REQUEST TO BECOME creator
    so that I CAN CREATE MY OUTFITS

Background:
    Given I am a registered user
    When I login

Scenario: User send successfully the request
    Given I am sending my first request to become creator
    When I go to the becomeCreator page
    And I fill in "creator_firstName" with "CreatorName"
    And I fill in "creator_lastName" with "CreatorLastName"
    And I fill in "creator_birthday" with "2002-03-24"
    #And I check "F" within "creator_gender_f"
    And I fill in "creator_message" with "CreatorMessage"
    And I press "createSubmit"
    Then I should be on the home page
    And I should see "Request sent correctly"

Scenario: User can't send the request cause another has already been sent
    Given I have already sent my first request to become creator
    When I go to the becomeCreator page
    Then I should be on the home page
    And I should see "A request to become a creator has already been sent"

Scenario: User's request has been refused
    Given I have sent my request and it has been refused
    When I go to the becomeCreator page
    Then I should be on the home page
    And I should see "Your request was refused because the description is not exhaustive or it does not comply with the site policy"