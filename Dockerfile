FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD theapp/Gemfile /myapp/Gemfile
ADD theapp/Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD theapp /myapp
