Feature: Name Suggestions

  Background: 
    Given   I am on the homepage
    And     I have not yet generated any names

  Scenario: Submitting name and allowing nickname and requesting male name adds new name to list
    Given   I have entered a male first name
    And     I leave Use Nickname selected
    When    I request a male rap name
    Then    I see the generated name at the top of the list of names
    And     I see a shortened nickname and not my full first name

  Scenario: Submitting name and initial and requesting female name adds new names to list
    Given   I have entered a female first name
    And     I have entered a last initial
    And     I have de-selected Use Nickname
    When    I request a female name
    Then    I see a female name appear at the top of the list containing my first name, initials, or first initial
    When    I request a female name a second time with the same settings
    Then    I see a different name appear above the old name still containing my full first name

  Scenario: Requesting male name with only last initial produces error message
    Given   I have entered a last initial
    When    I request a male rap name
    Then    I see an error message saying a first name is required

  Scenario: Requesting male name without any input produces error message
    Given   I have not entered a first or last name
    When    I request a male rap name
    Then    I see an error message saying a first name is required

  Scenario: Requesting female name with only last initial produces error message
    Given   I have entered a last initial
    When    I request a male rap name
    Then    I see an error message saying a first name is required

  Scenario: Requesting female name without any input produces error message
    Gien    I have not entered a first or last name
    When    I request a male rap name
    Then    I see an error message saying a first name is required
