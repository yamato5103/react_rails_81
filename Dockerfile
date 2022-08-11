FROM ruby:2.7.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
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
