source 'https://rubygems.org'

group :lint do
  gem 'foodcritic', '~> 3.0'
  gem 'foodcritic-rackspace-rules', :git => 'git@github.com:AutomationSupport/foodcritic-rackspace-rules.git'
  gem 'rubocop', '~> 0.24'
  gem 'rspec'
end

group :unit do
  gem 'berkshelf', '~> 3'
  gem 'chefspec'
  gem 'chef-sugar'
end

group :kitchen_common do
  gem 'test-kitchen'
  gem 'kitchen-rackspace'
  gem 'kitchen-docker'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant'
  gem 'vagrant-wrapper'
end

group :development do
  gem 'growl'
  gem 'rb-fsevent'
  gem 'guard'
  gem 'guard-kitchen'
  gem 'guard-foodcritic'
  gem 'guard-rubocop'
  gem 'fauxhai'
  gem 'pry-nav'
end
