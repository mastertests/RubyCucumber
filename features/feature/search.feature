# language: en
@feature
Feature: Artist searching for artist name

  Background: Open GitHub page
    Given I open main page

  Scenario Outline: Search result must contains search word(s)
    When I input "<search_term>" in search field
    Then I should see 10 element contains "<search_term>" word(s) in search results
    And I should see element "search_result_logo"
    Examples: Search terms
      | search_term |
      | Ruby        |
      | Java        |