FROM ruby:2.3.1

MAINTAINER oc222ba

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# - postgresql-client-9.4: In case you want to talk directly to postgres
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client-9.4 qt5-default libqt5webkit5-dev  --fix-missing 


# Create dir where the app is installed (inside of the Docker image)
RUN /bin/mkdir -p /hours


# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR /hours

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

#RUN bundle exec rake db:create db:migrate
#RUN bundle exec rake db:setup
RUN foreman start 

# The default command that gets ran will be to start the Unicorn server.
#CMD bundle exec unicorn -c ./config/unicorn.rb
