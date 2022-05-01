#!/usr/bin/env bash

cd `dirname $0`

# system ruby
/usr/bin/bundle install
/usr/bin/bundle exec ruby src/main.rb
# rbenv ruby
bundle install
bundle exec ruby src/main.rb

