## Airport filter API installation
Prerequisites: ruby 2.3.1 and rails 5.0.2
	
Install gem dependencies with Bundle:

    $ gem install bundler
    $ bundle install
    $ bundle exec rake db:create    

## Testing
[![Build Status](https://travis-ci.org/bashantad/airport-filter.svg?branch=master)](https://travis-ci.org/bashantad/airport-filter)

Code is tested using [RSpec](http://rspec.info/). Run the following command to run tests.

    $ bundle exec rspec spec/


## Usage

Run the program from command line

    $ rails server


Then it can filter by following params

		code, country_code, international_airport, regional_airport


Copyright (c) 2015 [Bashanta Dahal](https://github.com/bashantad)
