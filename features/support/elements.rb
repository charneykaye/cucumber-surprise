def find(how, what)
  begin
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(how, what).displayed? == true }
    @driver.find_element(how, what)
  end
end

def see(how, what)
  wait_for_page
  els = @driver.find_elements(how, what)
  els.empty? ? false : els[0].displayed?
end

def see_text(el, text)
  see(:xpath, "//#{el}[contains(.,'#{text}')]").should == true
end

def dont_see_text(el, text)
  see(:xpath, "//#{el}[contains(.,'#{text}')]").should == false
end

def enter(how, what, keys)
  input = find(how, what)
  input.click
  input.clear
  input.send_keys keys
end

def select(how, what, text)
  wait_for_page
  el = find(how, what)
  select = Selenium::WebDriver::Support::Select.new(el)
  select.select_by(:text, text)
end

def count(how, what)
  @driver.find_elements(how, what).size()
end

def get(how, what)
  @driver.find_element(how, what)
end
