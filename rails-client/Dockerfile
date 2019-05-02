
# Borrowed and modified from https://docs.docker.com/compose/rails/

# For now get a 2.6 ruby and nodeJS for asset stuff
FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs

# This creates the docker volume and dumps our CWD into it
RUN mkdir /rails-client-vol
WORKDIR /rails-client-vol
COPY Gemfile /rails-client-vol/Gemfile
COPY Gemfile.lock /rails-client-vol/Gemfile.lock
RUN bundle install
COPY . /rails-client-vol