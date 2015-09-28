def wait_for_js(markup, timeout = 15, increment = 0.2) #timeout in seconds
  timespan = 0
  loop do
    sleep increment
    break if @driver.execute_script(markup)

    timespan += increment
    if timespan > timeout
      raise "JS #{markup} not run in #{timeout}"
    end
  end
end

def wait_for_page markup = 'return window && window.jQuery && window.jQuery.active == 0;', timeout = 15
  begin
    wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
    wait.until {
      @driver.execute_script("return document && document.readyState ? document.readyState : '';") == 'complete'
    }
    wait_for_js markup, timeout
  end
end

def wait_for_shown selector
  wait_for_js "return $('#{selector}').is(':visible') && $('#{selector}').css('opacity') == '1';"
end

def wait_for_hidden selector
  wait_for_js "return !$('#{selector}').is(':visible') && $('#{selector}').css('opacity') == '1';"
end

def take_screenshot name
  screenshot_location = "screenshots/"

  `mkdir -p #{screenshot_location}`

  screenshot_location += "#{Time.now.getlocal.to_s.gsub("\ ","_")}_#{name.gsub("\ ","_")}.png"
  puts "Taking screenshot: #{screenshot_location}"
  @driver.save_screenshot screenshot_location
end
