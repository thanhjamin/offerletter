source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'minitest-rails'
gem 'devise'
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails',
                              github: 'anjlab/bootstrap-rails',
                              branch: '3.0.0'
gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-linkedin'
gem 'figaro'
gem 'pundit'
gem 'high_voltage'
gem 'pry-rails'
gem 'font-awesome-rails'
gem 'formtastic'
gem 'minitest-focus'
gem 'minitest-colorize'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :developemnt, :test do
  gem "minitest-rails-capybara"
  gem 'simplecov', require: false
  gem 'launchy'
  gem 'turn'
  #gem 'sqlite3'
  gem 'brakeman'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

ruby '2.0.0'
