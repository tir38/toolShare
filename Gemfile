source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'rspec-rails'
gem 'factory_girl_rails' , '~> 4.0'
gem 'jquery-rails'
gem 'shoulda', '3.3.2'  # adds rspec matchers for has_many through relationships
gem 'annotate'
gem 'bcrypt-ruby', '3.0.1' # adds encryption for email

group :development, :test do
  gem 'sqlite3'
  gem 'capybara', '2.0.0'
end

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
