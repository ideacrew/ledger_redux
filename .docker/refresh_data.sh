#!/bin/bash

echo -e "\n\n -- starting database -- \n\n"
docker-compose down
sleep 10 
docker volume rm ledger_redux_pgdata
sleep 5
docker-compose up -d db
sleep 10

echo -e "\n\n -- seeding covid most data -- \n\n"
docker-compose run --rm app bundle install
docker-compose run --rm app bundle exec rake db:migrate
docker-compose run --rm app bundle exec rake db:seed

docker-compose down
