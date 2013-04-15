source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'unicorn'
gem 'quiet_assets'

gem 'parallel'

gem 'twitter_oauth'
gem 'twitter'

group :development, :test do
  gem 'sqlite3'
  gem 'html2haml'
  gem 'erb2haml'
  gem 'rspec-rails', "~> 2.0"
  gem 'spork-rails', "~> 3.2"
  gem 'pry-rails'
end

group :production do
  gem 'pg'
end


# Templating
gem 'haml-rails'
gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
