FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    imagemagick \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

ADD Gemfile Gemfile.lock /app/
RUN gem install bundler:2.4.10
RUN bundle install

ADD . /app
