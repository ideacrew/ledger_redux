FROM ruby:2.6.5 AS ledger_redux_base

LABEL author="IdeaCrew"

ENV HOME /ledger_redux

RUN mkdir -p $HOME

WORKDIR $HOME

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

# Configure bundler and PATH
ENV LANG=C.UTF-8 \
    GEM_HOME=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
    BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /ledger_redux/bin:$BUNDLE_BIN

RUN apt-get update && \
    apt-get -yq dist-upgrade && \
    apt-get install -y imagemagick tzdata build-essential nodejs vim && \
    apt-get autoremove -y && \ 
    gem install bundler && \
    npm install --global yarn 

COPY . $HOME

# Setting env up
ENV RAILS_ENV='development'
ENV NODE_ENV='development'

RUN yarn install --check-files && \
    bundle config set deployment 'true' && \
    bundle install 


