
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


#
# Killing this portion since I think the compose will take care of it...
#
# Weird necessary hack according to docs
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
#EXPOSE 4001

# Normal rails s
#CMD ["rails", "server", "-b", "0.0.0.0"]