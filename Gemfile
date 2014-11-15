source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1'
gem 'devise'
gem 'figaro'

gem 'mysql2'
#gem 'thinking-sphinx', '~> 3.1.1'

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass'
gem 'haml-rails'
gem 'simple_form'
gem 'kaminari', github: 'amatsuda/kaminari'
gem 'draper', '~> 1.3'
gem 'uuid'

gem 'ckeditor'

gem 'non-stupid-digest-assets'

gem 'mini_magick'
gem 'carrierwave'
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'polyamorous', github: 'activerecord-hackery/polyamorous'
gem 'ransack', github: 'activerecord-hackery/ransack', branch: "rails-4.1"
gem 'formtastic', github: 'justinfrench/formtastic'

gem 'sidekiq'
gem 'sinatra'

group :development do
  gem 'letter_opener'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms => [:mri_19, :mri_20, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-inotify', :require => false

  # Use Capistrano for deployment
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-sidekiq'
end
group :development, :test do
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'spring'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end
