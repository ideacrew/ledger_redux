# Usage:
# docker volume create pgdata
# docker volume create gems
# docker-compose up
# docker-compose exec web bundle exec rake db:create db:schema:load ffcrm:demo:load

FROM ruby:2.6.5 AS ledger_redux_base

LABEL author="IdeaCrew"

ENV HOME /ledger_redux

RUN mkdir -p $HOME

WORKDIR $HOME

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# Configure bundler and PATH
ENV LANG=C.UTF-8 \
    GEM_HOME=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
    BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /ledger_redux/bin:$BUNDLE_BIN:$PATH

COPY . $HOME
RUN apt-get update && \
    apt-get -yq dist-upgrade && \
    apt-get install -y imagemagick tzdata build-essential nodejs vim && \
    apt-get autoremove -y && \ 
    cp config/database.postgres.docker.yml config/database.yml && \
    gem install bundler:2.1.4 && \
    npm install --global yarn && \
    yarn install --check-files && \
    bundle config set deployment 'true' && \
    bundle install 

FROM ledger_redux_base as ledger_redux

RUN bundle exec rails assets:precompile

