# If you do not have OpenSSL installed, update
# the following line to use "http://" instead
source 'https://rubygems.org'

# Specify your gem's dependencies in middleman-cells.gemspec
gemspec

group :development do
  gem 'rake'
  gem 'rdoc'
  gem 'yard'
end

group :test do
  gem 'cucumber', '~> 2.0.0'
  gem 'aruba', '~> 0.7.4'
  gem 'rspec', '~> 3.0.0'

  gem 'cells-erb'
  gem 'cells-haml'
  # Haml 4.1 is required (see https://github.com/trailblazer/cells-haml#installation)
  gem 'haml', github: 'haml/haml', ref: '7c7c169'
  gem 'cells-hamlit'
  gem 'hamlit'
  gem 'hashie'
end
