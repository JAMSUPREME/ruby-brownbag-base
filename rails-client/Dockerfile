
# For now get a 2.6 ruby and nodeJS for asset stuff
FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs

# Note that myapp is not related to our current working dir
# I'll try to see if I can omit all this later...?
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp