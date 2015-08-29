ruby '2.2.3'
source 'https://rubygems.org'

gem 'activemodel'
gem 'bootstrap-sass'
gem 'database_cleaner'
gem 'jquery-rails'
gem 'pg'
gem 'pry-nav'
gem 'puma'
gem 'quiet_assets'
gem 'rails'
gem 'rspec-rails'
gem 'rom'
gem 'rom-rails'

# Known issue: `rom-sql` must be `require`d before `rom-repository` :(
# https://github.com/rom-rb/rom-repository/issues/2
gem 'rom-sql'
gem 'rom-repository'

gem 'sass-rails'
gem 'scrypt'
gem 'slim-rails'
gem 'uglifier'

group :development, :test do
  gem 'dotenv-rails'
  gem 'rubocop'
  gem 'slim_lint'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'simplecov', require: false
end
