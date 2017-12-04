FROM ruby:2.3.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install imagemagick libmagickwand-dev

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
RUN bundle install
ADD Gemfile.lock /myapp
ADD . /myapp
