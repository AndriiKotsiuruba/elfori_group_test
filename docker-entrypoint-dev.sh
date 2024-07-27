#!/usr/bin/env bash

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# yarn husky install

bundle exec rake db:create
bundle exec rake db:migrate

# bundle exec rake parallel:create
# bundle exec rake parallel:prepare

exec "$@"
