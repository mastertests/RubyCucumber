require 'report_builder'

## Creating WebDriver
# Init path to drivers
Selenium::WebDriver::Firefox.driver_path = File.expand_path('..', Dir.pwd) + '/drivers/geckodriver.exe'
Selenium::WebDriver::Chrome.driver_path = File.expand_path('..', Dir.pwd) + '/drivers/chromedriver.exe'
Selenium::WebDriver::Edge.driver_path = File.expand_path('..', Dir.pwd) + '/drivers/MicrosoftWebDriver.exe'

# Init driver, delete possible cookies and maximize window
Before do
  $driver = case $browser
            when 'chrome'
              Selenium::WebDriver.for :chrome
            when 'firefox'
              Selenium::WebDriver.for :firefox
            else
              Selenium::WebDriver.for :edge
            end
  $driver.manage.delete_all_cookies
  $driver.manage.window.maximize if $fullscreen
end

# Reinit driver after each scenario
After '@feature' do
  $driver.manage.delete_all_cookies
  $driver.quit

  sleep $small_duration
end

# at_exit do
#   $driver.quit unless $driver.nil?
#
#   ReportBuilder.configure do |config|
#     # config.input_path = 'logs/json'
#     config.report_path = "logs/json"
#     config.report_types = %i[retry html]
#     config.report_title = 'Test Results'
#   end
#
#   ReportBuilder.build_report
# end