require 'capybara'
#require 'capybara/cucumber'
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
AMBIENTE = ENV['AMBIENTE']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

Capybara.configure do |config|
    config.default_driver = :selenium  
    #config.default_driver = :selenium_chrome   
    config.app_host = CONFIG['url_padrao'] 
    config.default_max_wait_time = 10    
    #config.app_host = 'http://10.50.254.162/P360'
    #config.app_host = 'http://localhost:4200/'
    $user = CONFIG['user'] 
    $password = CONFIG['password']
end     

Capybara.register_driver :selenium do |app|

    case BROWSER
    when 'chrome'
        Capybara::Selenium::Driver.new(
            app, 
            browser: :chrome,
            desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
            'chromeOptions' => { 'args' => ['--disable-infobars',
                                            '--start-maximized']}
            )
        )        
    when 'chrome_headless'
=begin        
        args = %w[headless disable-gpu no-sandbox]
        caps = Selenium::WebDriver::Remote::Capabilities.chrome(
            'chromeOptions' => { 
                'args' => args
                }
            )
           
        Capybara::Selenium::Driver.new(
            app, 
            browser: :chrome,
            desired_capabilities: caps
            )
=end 
        capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
            chromeOptions: { args: %w[headless disable-gpu window-size=1360,768] }
        )

        Capybara::Selenium::Driver.new(
            app,
            browser: :chrome,
            desired_capabilities: capabilities
        )
=begin
        options = Selenium::WebDriver::Chrome::Options.new(
            args: %w[headless disable-gpu no-sandbox]
        )
        
        Capybara::Selenium::Driver.new(
            app, 
            browser: :chrome, 
            options: options
            )        
=end                
    when 'firefox'
        Capybara::Selenium::Driver.new(
            app, 
            browser: :firefox, 
            :marionette =>true
        )
    when 'firefox_headless'
        browser_options = Selenium::WebDriver::Firefox::Options.new()
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

Capybara.javascript_driver = :headless_chrome