FROM ruby:3.2-alpine

WORKDIR /srv/jekyll

RUN apk add --no-cache \
    build-base \
    git \
    nodejs \
    yarn \
    python3 \
    && gem install bundler

COPY . .

RUN bundle install
RUN bundle exec jekyll build

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
