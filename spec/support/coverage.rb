require 'simplecov'

SimpleCov.minimum_coverage 95
SimpleCov.profiles.define 'awesome_toy_robot_simulator' do
  # @TODO add groups
end

RSpec.configure do |config|
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  else
    SimpleCov.start 'awesome_toy_robot_simulator'
  end
end
