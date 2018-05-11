Feature: Registration
  Some description

  @register
  Scenario: Sign in with default user
    When user inputs a valid email and password
    Then user has signed in successfully
