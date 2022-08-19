FROM ruby:2.7.0

RUN apt update && apt install -y \
        build-essential \
        libpq-dev \
        nodejs \
        postgresql-client \
        yarn\
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

WORKDIR /app_pr
COPY Gemfile Gemfile.lock /app_pr
RUN bundle install
