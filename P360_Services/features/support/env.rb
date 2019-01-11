require 'byebug'
require 'capybara'
require 'cucumber'
require 'rspec'
require 'savon'

ENVIRONMENT = ENV['ENVIRONMENT']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT}.yml")

Dir[File.join(File.dirname(__FILE__),
              '../services/*_services.rb')].each { |file| require_relative file }