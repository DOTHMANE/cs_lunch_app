# README

This project contains the Mystery lunch app. This is a Ruby on Rails 7 project.

You need:
* Docker & docker-compose
* Ruby 3.1.12

## Build the environment

  ```sh
  docker-compose build
  ```

## Database creation

  ```sh
  docker-compose run backend bundle exec rake db:setup
  ```

## Start the environment

  ```sh
  docker-compose up
  ```

## Working with the Rails container

  ```sh
  docker-compose exec backend bash
  ```

## Tests

  ```sh
  rspec
  ```

## Note

* For testing you can run mystery lunch service in the console using
  ```sh
  MysteryLunchService.new.process
  ```
* You can sign in with the user mail:'test@gmail.de', password:'12345678'
