require 'faker'

Given(/^a computer navigates to google search$/) do
puts  visit "http://www.google.com"
end

When(/^a computer searches for "(.*)"$/) do |searchtext|
  find(:css, 'input[title="Search"]').set(searchtext + "\n")
  sleep(2)
end

When(/^a computer searches for some random corporate bs$/) do
  page.save_screenshot("test.png")
  searchtext = Faker::Company.bs
  find(:css, 'input[title="Search"]').set(searchtext + "\n")
  sleep(2)
end

When(/^a computer searches for something from a list$/) do
  searchtext = something_from_a_list
  find(:css, 'input[title="Search"]').set(searchtext + "\n")
  sleep(2)
end

Then(/^the computer clicks on a random search result$/) do
  max_num = page.all("div.srg div.g").count
  num = 1 + rand(max_num)
  first(:css, "div.srg div.g:nth-of-type(#{num}) a").click
  sleep(3)
end

def something_from_a_list()
  options = [
    "Is Santa Claus real?",
    "Is Coca-Cola effective birth control?",
    "Is the sky falling?",
  ]
  options.sample
end

  


