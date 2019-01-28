## Creating WebDriver
# Init path to drivers
Selenium::WebDriver::Firefox.driver_path = '../drivers/geckodriver.exe'
Selenium::WebDriver::Chrome.driver_path = '../drivers/chromedriver.exe'
Selenium::WebDriver::Edge.driver_path = '../drivers/MicrosoftWebDriver.exe'

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
  $driver.manage.window.maximize
end

# Reinit driver after each scenario
After '@feature' do
  $driver.manage.delete_all_cookies
  $driver.quit

  sleep $small_duration
end

# # Close browser after all scenario if it didn't
# at_exit do
#   $driver.quit unless $driver.nil?
# end