#!/bin/bash
# never use the keys below, only meant for local development

echo -e "\n\n -- building development images -- \n\n"
docker-compose build
mkdir -p ../ledger_redux_config
rm -f config/credentials*
rm -f config/master*
echo -n "810a215f358279cf15bb8b4cb924a393" > config/master.key
echo -n "AOzTKLrtUuV3mVNilStDE+Q8FCyfVQCFhxkbF542r7/4gW/R/9WfF75ONkwMFgctdkH2Li0R/YCSgKIW76Uom5904KlwIAoHOdg097WIc3uVjOp7k5I8FsUWNNJ9Wb/sjrh2GN9sxgPBVzGKoC6w2er0QBf4tiL1TTJ1cuKZp2IBj9mzBv70FLIirD1q3Pky03Yp2xX3EbgqX/13zx8RH+Nupm9lpIIeqWjzlnHmrPXYpOhYk6rc0BlpPMDZ0wiswRP/8/8SrSIhs1KQCR+8H+oQIOp5O9hbA67xXhJp6UUwSCBVjuu8NsAb3jJSJ6PkfQwHVrDAy74U/h03kmllDDfFiIb0gCWfhWa9/y80IaAXfDBNa0KwobuP+neSIa+jjskafWq7gvCrbcUOHfJxwuh4RWNtSOCKmUJn--IEbN8amhPLk/N/7s--i1pSabGELr7TZv6nK0HPlA==" > config/credentials.yml.enc
cp config/master.key ../ledger_redux_config
cp config/credentials* ../ledger_redux_config
rm -f config/symmetric-encryption.yml && rm -rf .symmetric-encryption

echo -e "\n\n -- starting database -- \n\n"
docker-compose up -d db
sleep 10

echo -e "\n\n -- migrate tables and seed data -- \n\n"
docker-compose run --rm app bundle install
docker-compose run --rm app bundle exec rake db:migrate
docker-compose run --rm app bundle exec rake db:seed

if [ ! -f "../ledger_redux_config/symmetric-encryption.yml" -a ! -f "../ledger_redux_config/symmetric-encryption_production_v1.encrypted_key" ]
then
  echo -e "\n\n -- creating symmetric encryption keys -- \n\n"
  docker-compose run --rm app bundle exec symmetric-encryption -E production -g
  cp config/symmetric-encryption.yml ../ledger_redux_config/
  cp .symmetric-encryption/symmetric-encryption_production* ../ledger_redux_config
fi

docker-compose down
