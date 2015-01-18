require 'bundler/setup'
Bundler.setup

require 'poro'
require 'pry'

RSpec.configure do |config|
  config.order = 'random'
end
