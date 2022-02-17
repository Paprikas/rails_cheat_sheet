FROM ruby:3.0.1

MAINTAINER Maxim Zelenkin <nudepatch@gmail.com>

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt update -q && apt install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs \
    nano \
    yarn > /dev/null

ENV APP_PATH /app
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

ENV BUNDLE_PATH /bundle
ENV GEM_HOME /bundle
ENV PATH="/bundle/bin:${PATH}"

RUN printf '\
alias rc="bundle exec rails console" \n\
alias rtest="RAILS_ENV=test bundle exec rake test" \n\
alias stest="RAILS_ENV=test bundle exec rails test:system" \n\
alias be="bundle exec" \n\
alias rg="bundle exec rails generate" \n\
alias credit="bundle exec rails credentials:edit -e development" \n\
alias migrate_all="bundle exec rails db:migrate && RAILS_ENV=test bundle exec rails db:migrate" \n\
alias rollback_all="bundle exec rails db:rollback && RAILS_ENV=test bundle exec rails db:rollback" \n\
alias reset_db_all="bundle exec rails db:drop && bundle exec rails db:create && migrate_all" \n\
alias guardtest="be guard -P minitest" \n\
' >> ~/.bashrc

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
