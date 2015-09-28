Feature: Search
  In order to find answers
  As a Computer
  I want to search the internet

  Scenario: Computer searches the internet for some random corporate BS
    Given a computer navigates to google search
    When a computer searches for some random corporate bs
    Then the computer clicks on a random search result

  Scenario: Computer searches the internet for "something"
    Given a computer navigates to google search
    When a computer searches for "something"
    Then the computer clicks on a random search result

  Scenario: Computer searches the internet for something from a list
    Given a computer navigates to google search
    When a computer searches for something from a list
    Then the computer clicks on a random search result
