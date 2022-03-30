source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.1"

gem "bcrypt", "3.1.12"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-select-rails"
gem "cancancan"
gem "carrierwave", "1.1.0"
gem "ckeditor"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "delayed_job_active_record"
gem "devise"
gem "faker"
gem "fog", "1.40.0"
gem "jbuilder", "~> 2.5"
gem "mini_magick", "4.7.0"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 4.3"
gem "rails", "~> 5.2.2"
gem "rails-i18n"
gem "ransack"
gem "rubocop", "~> 0.54.0", require: false
gem "rufus-scheduler"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate", "~> 3.1.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "rails-controller-testing"
  gem "rspec-collection_matchers"
  gem "rspec-rails"
  gem "shoulda-matchers"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :production do
  gem "pg", "~> 0.18"
  gem "rails_12factor", "0.0.2"
end
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
