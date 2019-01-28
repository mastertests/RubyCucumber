# frozen_string_literal: true

When(/^I input "([^"]*)" in search field$/) do |search_term|
  @search_page = MainPage.new($driver).search_for(search_term)

  sleep $big_duration
end

Then(/^I should see (\d+) element contains "([^"]*)" word\(s\) in search results$/) do |element_count, search_term|

  unless @search_page.elements_contains_number == Integer(element_count)
    raise "Elements number do not match:\nExpected:#{element_count}\nActual:#{@search_page.elements_contains_number}"
  end

  @search_page.search_result.each do |element|
    raise "Fail because '<#{element[:title]}>  #{element[:text]}' do not contains search word" unless
          element[:title].downcase.include?(search_term.downcase) || element[:text].downcase.include?(search_term.downcase)
  end
end
