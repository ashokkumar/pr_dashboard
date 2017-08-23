FROM ruby:2.4.1@sha256:fd5849fbbedd7308ea82feedb0ce190a0db8f9e2b76773957033a3beb3a5cab6

RUN bash -c 'echo Australia/Melbourne > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata'

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list.d/pgdg.list \
 && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update \
 && apt-get install -y postgresql-client-9.6 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV NEW_RELIC_LOG STDOUT

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

WORKDIR /app

RUN bundle install

ADD . /app

RUN groupadd -r enquiries && useradd -r -m -g enquiries enquiries
USER enquiries

CMD ./support/dev/run
