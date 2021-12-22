#!/bin/bash

set -vx

bundle install

bundle exec rake db:migrate

rm -f tmp/pids/server.pid

bundle exec rails s -p 90 -b '0.0.0.0'
