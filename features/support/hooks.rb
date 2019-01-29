## Creating WebDriver
# Init path to drivers
Selenium::WebDriver::Firefox.driver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)), 'drivers', 'geckodriver.exe')
Selenium::WebDriver::Chrome.driver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)), 'drivers', 'chromedriver.exe')
Selenium::WebDriver::Edge.driver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)), 'drivers', 'MicrosoftWebDriver.exe')

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
  $driver.quit unless $driver.nil?

  sleep $small_duration
end