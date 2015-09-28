[![Build Status](https://travis-ci.org/charneykaye/cucumber-surprise.svg?branch=master)](https://travis-ci.org/charneykaye/cucumber-surprise)

# Cucumber Surprise

## Getting Started

From within the main project folder, install all the Gems specified in the `Gemfile`:

    cd cucumber-surprise
    bundle install

Then, you'll need to have a Selenium Standalone Server running, in order for Cucumber to interact with the web browser. The officials docs are [here](http://www.seleniumhq.org/download/). For example, download [selenium-server-standalone-2.47.1.jar](http://selenium-release.storage.googleapis.com/2.47/selenium-server-standalone-2.47.1.jar) and run it in the background using Java:

    java -jar selenium-server-standalone-2.47.1.jar

## Running the Tests

Once the Selenium Standalone Server is running in the background, simply run Cucumber to execute all of the tests within the `features/` folder:

    cucumber

Or, to execute one specific test:

    cucumber features/search.feature

Or, to execute one specific test in a specific browser, e.g. `firefox` or `chrome`:

    BROWSER=firefox cucumber features/search.feature
