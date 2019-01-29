class MainPage
  attr_accessor :search_field

  def initialize(browser)
    @browser = browser
    @search_field = $search_field[:locator]
    @menu_item = $menu_item[:locator]
  end

  def open_main_page
    @browser.get($main_page_url)
  end

  def page_title
    @browser.title
  end

  def navigate_to(menu_item_name)
    @browser.find_element(xpath: @menu_item.gsub('?', menu_item_name)).click
  end

  def element_present?(element_name)
    elt = eval("$#{element_name}")
    elements = @browser.find_elements("#{elt[:type]}": elt[:locator])
    !elements.empty? ? puts("Element '#{elements.first.object_id}' is present") : raise("Element '#{elements.first.text}' is absent")
  end

  def search_for(search_term)
    @element = @browser.find_element(xpath: @search_field)
    @element.click
    @element.send_keys(search_term, :enter)

    SearchPage.new(@browser)
  end
end