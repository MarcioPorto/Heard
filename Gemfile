source 'https://rubygems.org'

ruby '2.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # We are using SQLite in development and test mode
  gem 'sqlite3'

  # Testing
  gem 'factory_girl_rails'
  gem 'ffaker'
  # Autoload dotenv in Rails.
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'
  # Mocha for mocking
  gem 'mocha'
end

group :test do
  # Testing
  gem 'rspec-rails', '~> 2.14'
  gem 'shoulda-matchers'
end

group :production do
  # This is the setup necessary for hosting the database on Heroku
  gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# We are using the Geocoder gem to convert longitude and latitude values to
# an address
gem 'geocoder', '~> 1.3', '>= 1.3.1'
# simple_form is simply here for testing the app in development
gem 'simple_form', '~> 3.2', '>= 3.2.1'
# Rails requires this to operate in API mode
gem 'rails-api'
# Require to include the proper headers to make API calls
gem 'rack-cors', '~> 0.3.1'
# Used to annotate our models with our database schema
gem 'annotate', '~> 2.7'
# Authorization with CanCanCan
gem 'cancancan', '~> 1.10'
# Upvote/downvote functionality
gem 'acts_as_votable', '~> 0.10.0'

# Puma webserver
gem 'puma'
# Use Authy for 2FA
gem 'authy', git: 'https://github.com/authy/authy-ruby.git'
