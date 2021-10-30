# ./Dockerfile

# Extend from the official Elixir image
FROM elixir:latest


RUN apt-get update && \ 
  apt-get install -y inotify-tools && \
  apt-get install -y postgresql-client
# Create app directory and copy the Elixir projects into it
RUN mkdir /time_manager
COPY . /time_manager
WORKDIR /time_manager

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force
#RUN npm install

RUN mix deps.get
RUN mix local.rebar --force
RUN mix do compile

CMD ["/time_manager/entrypoint.sh"]