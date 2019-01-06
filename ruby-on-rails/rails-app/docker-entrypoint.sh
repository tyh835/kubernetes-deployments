#!/bin/sh
set -e

while ! nc -z postgres 5432; do
    echo "waiting for postgres..."
    sleep 1;
done

if [ "$RAILS_ENV" != production ]; then
  bin/rails db:create
fi

echo $RAILS_MASTER_KEY > config/master.key
RAILS_ENV=production bundle exec rake assets:precompile

exec "$@"
