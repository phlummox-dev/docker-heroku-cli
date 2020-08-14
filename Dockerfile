
FROM mhart/alpine-node:14.8.0@sha256:37656285632942ab616f12a5ab4c622e3a7fe7967af03eba78d6faa7adb18e06

LABEL maintainer="docker-heroku-cli@phlummox.dev"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.vcs-url="https://github.com/phlummox-dev/docker-heroku-cli"

RUN \
  apk add bash sudo

RUN : "adding user" && \
  addgroup -g 1001 user && \
  adduser -D -G user -u 1001 -g '' user && \
  echo '%user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN \
  wget -O - https://cli-assets.heroku.com/install.sh | bash -


