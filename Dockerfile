FROM ruby:2.6-stretch

ARG RAILS_ENV=development

ENV WORKDIR /instagram
ENV RAILS_ENV $RAILS_ENV
RUN mkdir -p $WORKDIR
WORKDIR ${WORKDIR}

# Installing curl
RUN apt-get install curl -y


# Installing nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential nodejs libpq-dev libc6-dev wget

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list


RUN apt update && apt install yarn -y --no-install-recommends
RUN yarn install --check-files


COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock


RUN gem install bundler -v "2.1.4"
RUN bundle install

COPY . .

RUN chmod 777 delete-processes-id.sh
ENTRYPOINT ["./delete-processes-id.sh"]

