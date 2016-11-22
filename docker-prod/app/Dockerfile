FROM ruby:2.3.1

MAINTAINER oc222ba

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# - postgresql-client-9.4: In case you want to talk directly to postgres
RUN apt-get update && apt-get install -qq --yes --force-yes build-essential nodejs libpq-dev libqt5webkit5-dev qt5-default --fix-missing

ENV DIR /hours

# Create dir where the app is installed (inside of the Docker image)
RUN mkdir -p $DIR

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $DIR

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock


RUN bundle install --without development test

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

ENV RAILS_ENV production 
#&& RACK_ENV=production

# The default command that gets ran will be to start the Unicorn server.
CMD bundle exec unicorn -p 7000 -c ./config/unicorn.rb
