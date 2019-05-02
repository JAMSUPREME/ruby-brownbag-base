# Ruby Brownbag Base

Baseline for some Ruby brownbags

# How to run it

**Pre-reqs:** 
_(I think these are the right links...)_
- Docker: https://hub.docker.com/search/?type=edition&offering=community
- Docker Compose: https://docs.docker.com/compose/install/

**Actual steps:**
- `docker-compose up`
- Navigate to `localhost:4001` to see the rails welcome page

# Contents

It currently contains two live APIs:
- "Rails Client" - Our wonderful client app where we will build code
- "Dumpster API" - This exists in master for a couple reasons:
  - Makes it easy if you want to add/remove more apps to simulate a cluster or microservices since the topmost docker-compose is set up for that
  - Helps me make sure the networking stuff isn't botched between containers
  - Will be our first brown bag material and a look at a real mess of an API
  - Could be repurposed if you wanted to be lazy and not deal with docker stuff
  
# How to add another app

It should only require a few steps:

- Make a new dir `my-very-cool-service`
- Add files:
  - `Dockerfile` (should look like the following)
```
FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs

WORKDIR /my-very-cool-service-vol
COPY Gemfile /my-very-cool-service-vol/Gemfile
COPY Gemfile.lock /my-very-cool-service-vol/Gemfile.lock
RUN bundle install
COPY . /my-very-cool-service-vol
```
  - `Gemfile` (should look like the following)
```
source 'https://rubygems.org'
gem 'rails', '~>5'
```
  - `Gemfile.lock` (empty)
- Add the new service into `docker-compose.yml`
- Run `docker-compose run my-very-cool-service rails new . --force --no-deps`