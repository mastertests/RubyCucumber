# language: en
@feature
Feature: Check main page content

  Background: Open GitHub page
    Given I open main page

  Scenario Outline: Menu navigation
    When I navigate to "<menu_name>" menu item
    Then I should see element "<element>"
    Examples:
      | menu_name   | element            |
      | Marketplace | marketplace_header |
      | Enterprise  | enterprise_header  |


  Scenario Outline: Main page should contain elements
    Then I should see element "<element>"
    Examples:
      | element          |
      | github_logo      |
      | main_page_header |
      | signup_form      |