require 'rubygems'
require 'bundler'

ENV['RACK_ENV'] = 'test'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

caps = Appium.load_appium_txt file: File.join(Dir.pwd, './appium.txt')


$LOAD_PATH.unshift File.expand_path('../pages', File.dirname(__FILE__))

require 'page'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:each) do
    @driver = Appium::Driver.new(caps)
    @driver.start_driver
  end

  config.after(:each) do
    @driver.driver_quit
  end

end
