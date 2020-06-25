docker build --build-arg DB_DATABASE=ledger_redux_development \
	     --build-arg DB_USERNAME=postgres \
	     --build-arg DB_PASSWORD=postgres_local \
	     --build-arg DB_HOST='host.docker.internal' \
	     -f .docker/production/Dockerfile --target app -t ideacrew/ledger_redux_app:$1 .
docker build --build-arg DB_DATABASE=ledger_redux_development \
             --build-arg DB_USERNAME=postgres \
             --build-arg DB_PASSWORD=postgres_local \
             --build-arg DB_HOST='host.docker.internal' \
	     -f .docker/production/Dockerfile --target web -t ideacrew/ledger_redux_web:$1 .
