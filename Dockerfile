FROM ruby:3.2.9-alpine3.23

WORKDIR /app

COPY . .

CMD ["ruby", "run.rb"]