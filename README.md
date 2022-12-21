# README

This project contains the Mystery lunch app. This is a Ruby on Rails 7 project.

You need: docker & docker-compose ruby 3.1.12

Build the environment: docker-compose build

Database creation: run docker-compose run backend bundle exec rake db:setup

Start the environment: docker-compose up

Working with the Rails container
Run docker-compose exec backend bash
Do everything in the container
Run tests: rspec

Note: you can sign in with the user mail:'test@gmail.de', password:'12345678'
