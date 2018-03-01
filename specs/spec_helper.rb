require 'time'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
# Add simplecov

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative '../lib/booking'
require_relative '../lib/booking_manager'
require_relative '../lib/room'
require_relative '../lib/block'
require_relative '../lib/staff'
require_relative '../lib/customer'
