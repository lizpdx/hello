FROM ruby:2.2.1
MAINTAINER Liz <liz.savage@jivesoftware.com>

RUN apt-get update && \
	apt-get install -y net-tools

# install gems
ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# upload source
COPY . $APP_HOME

# start server
ENV PORT 3000
EXPOSE 3000
CMD ["ruby", "hello.rb"]

