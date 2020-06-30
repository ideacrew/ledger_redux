source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'


### Extensions

# IdeaCrew Gems
# gem 'fat_free_crm',       git:  'https://github.com/ideacrew/fat_free_crm.git', branch: 'release_0.3.1'
gem 'fat_free_crm',       path:  './vendor/plugins/fat_free_crm'

gem 'resource_registry',    git:  'https://github.com/ideacrew/resource_registry.git', branch: 'branch_0.8.0'
# gem 'resource_registry',  path:  './vendor/plugins/resource_registry'

gem 'poly_press',           git:  'https://github.com/ideacrew/poly_press.git', branch: 'master'
gem 'call_center',          git:  'https://github.com/ideacrew/call_center.git', branch: 'master'

# Third-party gems
gem "typhoeus",             '~> 1.4'
gem 'symmetric-encryption', '~> 4.3'

gem 'dry-validation',       '~> 1.5'
gem 'dry-struct',           '~> 1.0'
gem 'dry-monads',           '~> 1.3'
gem 'dry-matcher',          '~> 0.8'
gem 'mime-types'
gem 'rails-i18n',           '~> 6.0'


# FFCRM dependencies
gem 'devise'
gem 'devise-i18n'
gem 'devise-encryptable'
gem 'cancancan'

gem 'rails-observers'

gem 'active_model_serializers'
gem 'activemodel-serializers-xml'
gem 'responders'

gem 'jquery-rails'
gem 'jquery-migrate-rails'
gem 'jquery-ui-rails'
gem 'rails3-jquery-autocomplete'
gem 'font-awesome-rails'
gem 'sass'
gem 'coffee-rails'

gem 'country_select'
gem 'select2-rails'
gem 'simple_form'
gem 'haml'
gem 'will_paginate'
gem 'dynamic_form'

gem 'paperclip'
gem 'paper_trail'
gem 'acts_as_commentable'
gem 'acts-as-taggable-on'
gem 'acts_as_list'
gem 'premailer'

gem 'responds_to_parent'
gem 'rails_autolink'
gem 'coffee-script-source'

gem 'ransack', '>= 1.6.2'
gem 'ransack_ui', '~> 1.3', '>= 1.3.1'
gem 'ransack_chronic'

###

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw], require: false
  gem 'pry-byebug', require: false
  gem 'pry-rails', require: false
  gem 'pry-stack_explorer', require: false

  gem 'capybara'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'rubocop'
  
  gem 'ffaker', '>= 2'

  gem 'json_spec'
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'yard', '~> 0.9'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
