FROM ruby:2.5

MAINTAINER Xavi Vega <xabi1309@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev sqlite3
# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 9292