source 'https://rubygems.org'
gem 'rails', '3.2.8'
gem 'sqlite3'

def darwin_only(require_as)
  RUBY_PLATFORM.include?('darwin') && require_as
end

def linux_only(require_as)
  RUBY_PLATFORM.include?('linux') && require_as
end


group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "less-rails", ">= 2.2.6"
  gem "twitter-bootstrap-rails", ">= 2.1.6"
  gem "therubyracer", ">= 0.10.2", :platform => :ruby
end



gem 'jquery-rails'
gem "thin", ">= 1.5.0"

group :development, :test do
  gem "rspec-rails", ">= 2.11.4"
  gem "database_cleaner", ">= 0.9.1"
  gem "email_spec", ">= 1.4.0"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "launchy", ">= 2.1.2"
  gem "capybara", ">= 1.1.3"
  gem "factory_girl_rails", ">= 4.1.0"
end

group :development do
  gem 'guard-rspec'
  gem 'guard-cucumber'

  gem 'rb-fsevent', require: darwin_only('rb-fsevent')
  gem 'growl',      require: darwin_only('growl')
  gem 'rb-inotify', require: linux_only('rb-inotify')
end

#authentification
gem "devise", ">= 2.1.2"
gem "omniauth"
gem "omniauth-ldap"



#authorization
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"

#simple form
gem "simple_form", ">= 2.0.4"


#settings
gem 'settingslogic'
