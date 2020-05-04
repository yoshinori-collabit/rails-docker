FROM ruby:2.7.1

ENV APP_DIR /myapp

ENV LANG C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -

RUN apt-get update -qq && apt-get install -y \
  default-mysql-client \
  vim \
  nodejs \
  npm

RUN mkdir ${APP_DIR}
WORKDIR ${APP_DIR}

COPY Gemfile ${APP_DIR}/Gemfile
COPY Gemfile.lock ${APP_DIR}/Gemfile.lock

RUN bundle install

COPY . ${APP_DIR}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
