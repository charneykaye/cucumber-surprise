require 'rubygems'
require 'selenium-webdriver'

http_client = Selenium::WebDriver::Remote::Http::Default.new

base_path = "http://outright.dev/"
sql_host = "localhost"

ENV['SELENV'] ||= 'local'
case ENV['SELENV']
when 'grid'
  selenium_url = 'http://seleniumgrid:4444/wd/hub'
when 'local'
  selenium_url = 'http://localhost:4444/wd/hub'
when 'winvm'
  selenium_url = 'http://winvm:4444/wd/hub'
end

case ENV['BROWSER'] ||= 'chrome'
when 'chrome'
  caps = Selenium::WebDriver::Remote::Capabilities.chrome
  caps['takesScreenshot'] = true
  caps['platform'] = ENV['PLATFORM']
  caps['chromeOptions'] = { args: ['--test-type'] }
when 'firefox'
  caps = Selenium::WebDriver::Remote::Capabilities.firefox
  caps['takesScreenshot'] = true
  caps['platform'] = ENV['PLATFORM']
end

Before do
  @base_url = base_path
  @driver = Selenium::WebDriver.for(:remote, :url => selenium_url, :desired_capabilities => caps, :http_client => http_client)
  @driver.manage.timeouts.implicit_wait = 3
end

After do |s|
  if (s.failed? && ENV['STOPONFAIL'] != 'false')
    take_screenshot s.name
    Cucumber.wants_to_quit = true
  end
  @driver.quit
end
