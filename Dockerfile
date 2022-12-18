FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /Cs_Lunch_App
WORKDIR /Cs_Lunch_App
ADD Gemfile /Cs_Lunch_App/Gemfile
ADD Gemfile.lock /Cs_Lunch_App/Gemfile.lock
RUN bundle install
ADD . /Cs_Lunch_App
