class SearchPage
  attr_accessor :search_result_title, :search_result_text

  def initialize(browser)
    @browser = browser
    @search_result_title = $search_result_title[:locator]
    @search_result_text = $search_result_text[:locator]
  end

  # @return [Integer] Number of search results
  def elements_contains_number
    @browser.find_elements(xpath: @search_result_title).size
  end

  # @return [Hash] Search results present on page with Title and Text
  def search_result
    elements_titles = @browser.find_elements(xpath: @search_result_title)
    elements_texts = @browser.find_elements(xpath: @search_result_text)
    elements = []
    i = 0

    while i < elements_titles.size
      elements << { title: elements_titles[i].text, text: elements_texts[i].text }
      i += 1
    end

    elements
  end
end