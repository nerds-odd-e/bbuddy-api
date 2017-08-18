FROM ruby:2.4

RUN wget -O /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.jessie
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /bbuddy
WORKDIR /bbuddy

ENV RAILS_ENV test

ADD Gemfile /bbuddy/Gemfile
ADD Gemfile.lock /bbuddy/Gemfile.lock
RUN bundle install

ADD . /bbuddy


