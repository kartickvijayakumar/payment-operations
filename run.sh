#!/bin/bash

set -vx

bundle install

rails generate hws:payment_operations_demo:install
bundle exec rake db:migrate

rm -f tmp/pids/server.pid

bundle exec rails s -p 80 -b '0.0.0.0'
