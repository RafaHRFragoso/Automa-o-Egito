require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara//rspec/matchers'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(Pages)

Capybara.configure do |config|
    config.default_driver = :selenium_chrome    
    config.default_max_wait_time = 10
    config.app_host = 'http://10.50.254.162/P360'
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
  