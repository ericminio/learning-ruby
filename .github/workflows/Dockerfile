FROM ruby:3.3.0-alpine3.19

RUN apk update && apk add \
    bash 

WORKDIR /usr/src/ruby

COPY tests.sh tests.sh
COPY about about

