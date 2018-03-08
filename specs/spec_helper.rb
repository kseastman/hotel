require 'simplecov'
SimpleCov.start do
  add_filter "/specs/"
end

require 'time'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative '../lib/booking'
require_relative '../lib/booking_manager'
require_relative '../lib/room'
require_relative '../lib/user'
require_relative '../lib/block'
require_relative '../lib/duration'
