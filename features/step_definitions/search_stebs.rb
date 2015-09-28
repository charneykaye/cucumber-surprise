require 'faker'

Given(/^a computer navigates to google search$/) do
  @driver.navigate.to "https://www.google.com/"
end

When(/^a computer searches for "(.*)"$/) do |searchtext|
  enter(:css, 'input[title="Search"]', searchtext + "\n")
  sleep(2)
end

When(/^a computer searches for some random corporate bs$/) do
  searchtext = Faker::Company.bs
  enter(:css, 'input[title="Search"]', searchtext + "\n")
  sleep(2)
end

Then(/^the computer clicks on a random search result$/) do
  max_num = count(:css, 'div.srg div.g')
  num = 1 + rand(max_num)
  find(:css, "div.srg div.g:nth-of-type(#{num}) a").click
  sleep(3)
end

When(/^a computer searches for something from a list$/) do
  searchtext = something_from_a_list
  enter(:css, 'input[title="Search"]', searchtext + "\n")
  sleep(2)
end

def something_from_a_list()
  options = [
    "Is Santa Claus real?",
    "Is Coca-Cola effective birth control?",
    "Is the sky falling?",
  ]
  options.sample
end

  


