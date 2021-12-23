#!/bin/bash

set -vx

bundle install

rails generate hws:payment_operations_demo:install
bundle exec rake db:migrate
rake hws-instruments:hypto:payouts["e87a7c07-55cf-4e69-bf14-10006657f3fb"]
rake hws-instruments:hypto:virtual_account["e87a7c07-55cf-4e69-bf14-10006657f3fb"]

rm -f tmp/pids/server.pid

bundle exec rails s -p 80 -b '0.0.0.0'
