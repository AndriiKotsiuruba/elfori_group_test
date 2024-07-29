# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7', '>= 6.1.7.3'
# Pg is the Ruby interface to the PostgreSQL RDBMS. It works with PostgreSQL 9.3 and later.
gem 'pg', '~> 1.5', '>= 1.5.6'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Object oriented authorization for Rails applications
gem 'pundit', '~> 2.3', '>= 2.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.9', '>= 4.9.4'

# The administration framework for Ruby on Rails.
gem 'activeadmin', '~> 3.2', '>= 3.2.2'

# File Attachment toolkit for Ruby applications
gem 'shrine', '~> 3.6'

# Official AWS Ruby gem for Amazon Simple Storage Service
gem 'aws-sdk-s3', '~> 1.14'

# An Active Admin plugin to use Froala WYSIWYG editor
gem 'activeadmin_froala_editor', '~> 1.1'

# Easy way to build and manage commands (service objects)
gem 'simple_command', '~> 1.0', '>= 1.0.1'

group :development do
  # The Listen gem listens to file modifications and notifies you about the changes.
  gem 'listen', '~> 3.8'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '~> 4.2', '>= 4.2.1'

  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring', '~> 4.1', '>= 4.1.3'

  # A Ruby static code analyzer and formatter
  gem 'rubocop',             '~> 1.60', '>= 1.60.2', require: false
  gem 'rubocop-performance', '~> 1.20', '>= 1.20.2', require: false
  gem 'rubocop-rails',       '~> 2.23', '>= 2.23.1', require: false
  gem 'rubocop-rspec',       '~> 2.26', '>= 2.26.1', require: false

  # A tool to help lint your ERB or HTML files using the included linters or by writing your own.
  gem 'erb_lint', '>= 0.5.0', require: false

  # Help to kill unused eager loading
  gem 'bullet', '~> 7.1', '>= 7.1.6'

  # Help to kill N+1 queries
  gem 'pg_query', '~> 5.1'
  gem 'prosopite', '~> 1.4', '>= 1.4.2'

  # Preview email in the default browser instead of sending it
  gem 'letter_opener_web', '~> 2.0'

  # Automatically generate an entity-relationship diagram (ERD) for your Rails models
  # gem 'rails-erd', '~> 1.7', '>= 1.7.2'

  # Active Record Doctor helps to keep the database in a good shape
  gem 'active_record_doctor', '= 1.10'
end

group :test do
  # Strategies for cleaning databases. Can be used to ensure a clean slate for testing.
  gem 'database_cleaner', '~> 2.0', '>= 2.0.2'

  # Retry intermittently failing rspec examples
  gem 'rspec-retry', '~> 0.6.2'

  # Provides one-liners to test common Rails functionality
  gem 'shoulda-matchers', '~> 6.1'

  # Library for stubbing and setting expectations on HTTP requests
  gem 'webmock', '~> 3.19', '>= 3.19.1'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Shim to load environment variables from .env into ENV in development
  gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'

  # A framework and DSL for defining and using factories
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'

  # Used to easily generate fake data: names, addresses, phone numbers, etc
  gem 'faker', '~> 3.2', '>= 3.2.3'

  # Testing framework for Rails
  gem 'rspec-rails', '~> 6.1', '>= 6.1.1'

  # Annotate Rails classes with schema and routes info
  gem 'annotate', '~> 3.2'

  # rswag
  gem 'rswag-specs', '~> 2.13'

  # Ruby applications tests profiling tools
  gem 'test-prof', '~> 1.3', '>= 1.3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
