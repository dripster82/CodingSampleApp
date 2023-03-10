FROM ruby:3.1.2 AS drkiq-development

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# Install gems
WORKDIR $INSTALL_PATH
COPY Gemfile* .
RUN gem install rails bundler
RUN bundle install

# Clear old pid file
COPY . .
RUN rm -f $INSTALL_PATH/tmp/pids/server.pid

# Ensure all assets are created
RUN rails assets:precompile
EXPOSE 8010

# Start server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8010"]