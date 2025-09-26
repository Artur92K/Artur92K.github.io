FROM ruby:3.4.6-alpine

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

# Use this to keep container alive if you want, or remove CMD if not needed
CMD ["tail", "-f", "/dev/null"]
