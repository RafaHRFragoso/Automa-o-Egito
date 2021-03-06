require 'capybara'
# require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'faker'
require 'rake'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'page_helper.rb'
require_relative 'helper.rb'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(Pages)
World(Helper)

BROWSER = ENV['BROWSER']
ENVIRONMENT = ENV['ENVIRONMENT']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT}.yml")

Capybara.configure do |config|
  config.default_driver = :selenium
  # config.default_driver = :selenium_chrome
  config.app_host = CONFIG['url_padrao']
  config.default_max_wait_time = 10
  # config.app_host = 'http://10.50.254.162/P360'
  # config.app_host = 'http://localhost:4200/'
end

Capybara.register_driver :selenium do |app|
  case BROWSER
  when 'chrome'
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { 'args' => ['--disable-infobars',
                                        '--start-maximized'] }
      )
    )
  when 'chrome_headless'
    # args = %w[headless disable-gpu no-sandbox]
    # caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    #     'chromeOptions' => {
    #         'args' => args
    #         }
    #     )
    # Capybara::Selenium::Driver.new(
    #     app,
    #     browser: :chrome,
    #     desired_capabilities: caps
    #     )

    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w[headless disable-gpu window-size=1360,768] }
    )

    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: capabilities
    )
    # options = Selenium::WebDriver::Chrome::Options.new(
    #     args: %w[headless disable-gpu no-sandbox]
    # )

    # Capybara::Selenium::Driver.new(
    #     app,
    #     browser: :chrome,
    #     options: options
    #     )

  when 'firefox'
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      # :marionette => true (ruby v1.8)
      marionette: true
    )
  when 'firefox_headless'
    browser_options = Selenium::WebDriver::Firefox::Options.new
    browser_options.args << '--headless'
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      options: browser_options
    )
  when 'safari'
    Capybara::Selenium::Driver.new(
      app,
      browser: :safari
    )
  end
end
