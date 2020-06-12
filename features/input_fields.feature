Feature: Input Fields

  Background: 
    Given   I am on the homepage

  Scenario: Input fields exist
    Then    I see an input field for my first name
    And     I see an input field for my last initial

  Scenario: Input fields start empty
    Then    I do not see values in the input fields

  Scenario: Input fields can have text entered in them
    Then    I can enter text in the first name field
    Then    I can enter text in the last initial field