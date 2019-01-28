require 'rubygems'
require 'selenium-webdriver'

$main_page_url = 'https://github.com/'
$browser = ENV['BROWSER']

$big_duration = 5 # sec
$small_duration = 2 # sec
$large_duration = $big_duration + $small_duration

# Locators
$marketplace_header = { type: 'xpath', locator: "//div[@id='js-pjax-container']//h1" }
$enterprise_header = { type: 'xpath', locator: "//div[contains(@class, 'jumbotron-codelines')]//h1" }

$github_logo = { type: 'xpath', locator: "//div/a[@class='mr-4']" }
$main_page_header = { type: 'xpath', locator: "//h1[contains(@class,'h000-mktg')]" }
$signup_form = { type: 'xpath', locator: "//div[1]/form[contains(@class,'home-hero-signup')]" }

$search_result_logo = { type: 'xpath', locator: "//img[contains(@alt,'logo')]" }
$search_result_title = { type: 'xpath', locator: "//h3/a[@class='v-align-middle']" }
$search_result_text = { type: 'xpath', locator: "//li/div/p[contains(@class,'col-12')]" }

$search_field = { type: 'xpath', locator: "//label/input[@type='text']" }
$menu_item = { type: 'xpath', locator: "//li/a[contains(.,'?')]" }
