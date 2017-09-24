source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails-controller-testing'
gem 'rails', '~> 5.1.4'# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'puma', '~> 3.7' # Use Puma as the app server
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
# gem 'therubyracer', platforms: :ruby # See https://github.com/rails/execjs#readme for more supported runtimes
gem 'coffee-rails', '~> 4.2'# Use CoffeeScript for .coffee assets and views
gem 'turbolinks', '~> 5'# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'jbuilder', '~> 2.5'# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'bootstrap-sass'
# gem 'redis', '~> 3.0' # Use Redis adapter to run Action Cable in production
gem 'bcrypt', '~> 3.1.7', platforms: [:ruby, :x64_mingw]

gem 'devise'
gem 'geocoder'
gem 'gmaps4rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'annotate', require: false
gem 'mail_form', '~> 1.5', '>= 1.5.1'
gem 'font-awesome-sass'
gem 'omniauth'
gem 'omniauth-facebook'


group :development, :test do
gem 'foreman'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
