source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare your gem's dependencies in meta_information.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

if ENV["RAILS_VERSION"]
  gem "rails", "~> #{ENV['RAILS_VERSION']}"
end

if ENV["SQLITE_VERSION"]
  gem "sqlite3", "~> #{ENV['SQLITE_VERSION']}"
end
