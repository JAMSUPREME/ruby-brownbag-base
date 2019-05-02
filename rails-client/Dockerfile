
# For now get a 2.6 ruby and nodeJS for asset stuff
FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs

# Note that myapp is not related to our current working dir
# I'll try to see if I can omit all this later...?
RUN mkdir /rails-client-vol
WORKDIR /rails-client-vol
COPY Gemfile /rails-client-vol/Gemfile
COPY Gemfile.lock /rails-client-vol/Gemfile.lock
RUN bundle install
COPY . /rails-client-vol