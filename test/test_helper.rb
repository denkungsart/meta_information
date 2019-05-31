# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require "combustion"
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

Combustion.path = "test/internal"
Combustion.initialize! :all
