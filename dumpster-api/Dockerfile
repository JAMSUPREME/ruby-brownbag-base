
# Borrowed and modified from https://docs.docker.com/compose/rails/

# For now get a 2.6 ruby and nodeJS for asset stuff
FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs

# This creates the docker volume and dumps our CWD into it
WORKDIR /dumpster-api-vol
COPY Gemfile /dumpster-api-vol/Gemfile
COPY Gemfile.lock /dumpster-api-vol/Gemfile.lock
RUN bundle install
COPY . /dumpster-api-vol