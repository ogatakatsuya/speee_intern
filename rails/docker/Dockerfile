FROM ruby:3.3.4-slim

ENV TZ Asia/Tokyo
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV RUBY_YJIT_ENABLE=1

RUN gem install bundler:2.5.17
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash
RUN apt-get update -qq && apt-get install -y nodejs g++ make libmariadb-dev && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mkdir -p tmp/pids log
COPY Gemfile /app
COPY Gemfile.lock /app

RUN bundle install --jobs 4

COPY . /app

RUN mkdir -p tmp/pids log

RUN bin/rails assets:precompile
CMD rm -f tmp/pids/server.pid && bin/rails server --binding=0.0.0.0
