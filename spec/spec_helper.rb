require 'bundler/setup'
Bundler.setup

require 'define-poro'
require 'pry'

RSpec.configure do |config|
  config.order = 'random'
end
