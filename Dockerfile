FROM ruby:3.1

ENV BUILDER_VERSION=2.3.25

RUN apt-get update && \
    apt-get install -y build-essential libpq-dev nodejs

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v $BUILDER_VERSION
RUN bundle install

COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
