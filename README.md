[![Build Status](https://travis-ci.org/andypmw/rails-web-scraper-micro-service.svg?branch=master)](https://travis-ci.org/andypmw/rails-web-scraper-micro-service)
[![codecov](https://codecov.io/gh/andypmw/rails-web-scraper-micro-service/branch/master/graph/badge.svg)](https://codecov.io/gh/andypmw/rails-web-scraper-micro-service)
[![Known Vulnerabilities](https://snyk.io/test/github/andypmw/rails-web-scraper-micro-service/badge.svg)](https://snyk.io/test/github/andypmw/rails-web-scraper-micro-service)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/47be6b2ff2104b5689aca54f6b09ae76)](https://www.codacy.com/app/andypmw/rails-web-scraper-micro-service?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=andypmw/rails-web-scraper-micro-service&amp;utm_campaign=Badge_Grade)


# Rails Web Scraper Micro Service
This micro service has two functions:
1. Accept HTTP or HTTPS URL then parse and store contents at Cassandra DB
1. Return parsed and stored contents for an URL from Cassandra DB

## Elastic and High Available Deployment Architecture
![Alt text](doc/AWS-deploy-architecture.png?raw=true "Elastic and high available deployment architecture for the micro service")

## Get up and running

### System dependencies
1. Ruby, minimum version: 2.3.3
1. PhantomJS (with PhantomJS we can get content from a dynamic JavaScript website)
1. Redis
1. Sidekiq service
1. Apache Cassandra 3.x

### Ruby on Rails initialization
```
bundle install
```

### Database creation
```
RAILS_ENV=test rake cequel:keyspace:create
RAILS_ENV=test rake cequel:migrate
RAILS_ENV=development rake cequel:keyspace:create
RAILS_ENV=development rake cequel:migrate
```

### Database initialization
```
rails db:seed
```

### How to run the test suite
```
rails t
```

### How to run on development mode
Please run below command, the Rails app will listen on port 3000. And then use API tools such as Postman to interact with it:
```
rails s
```

## API Endpoints
```
POST /index-job : to create a new index job
GET  /index-job/(customer-id) : to get a customer's index jobs
GET  /index-job/(customer-id)/(index-job-id) : to get an index job's contents
```

## Microservice detail

### Scaling strategy
1. For Cassandra database, we can scale-out Cassandra Ring by add more database node.
1. For high count of queue, we can scale-out web scraping using AWS autoscale group for Sidekiq worker.

### Assumptions
1. first assumption
1. second assumption
1. third assumption
