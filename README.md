# Ruby Brownbag Base

Baseline for some Ruby brownbags

# How to run it

**Pre-reqs:** 
_(I think these are the right links...)_
- Docker: https://hub.docker.com/search/?type=edition&offering=community
- Docker Compose: https://docs.docker.com/compose/install/

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