# frozen_string_literal: true

Given(/^I open main page$/) do
  @main_page = MainPage.new($driver)
  @main_page.open_main_page
end

Then(/^I should see element "([^"]*)"$/) do |element|
  @main_page.element_present?(element)
end

When(/^I navigate to "([^"]*)" menu item$/) do |item_name|
  @main_page.navigate_to(item_name)

  sleep $big_duration
end