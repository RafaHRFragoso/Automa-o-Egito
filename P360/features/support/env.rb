require 'capybara'
#require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'faker'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'page_helper.rb'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(Pages)

Capybara.configure do |config|
    config.default_driver = :selenium_chrome    
    config.default_max_wait_time = 10
    config.app_host = 'http://10.50.254.162/P360'
    #config.app_host = 'http://localhost:4200/'
end     

Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
            'chromeOptions' => { 'args' => ['--disable-infobars',
                                            '--start-maximized']}
        )
    )        
end
  