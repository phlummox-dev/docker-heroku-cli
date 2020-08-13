
FROM mhart/alpine-node:14.8.0@sha256:37656285632942ab616f12a5ab4c622e3a7fe7967af03eba78d6faa7adb18e06

RUN \
  apk add bash sudo

RUN : "adding user" && \
  addgroup -g 1001 user && \
  adduser -D -G user -u 1001 -g '' user && \
  echo '%user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN \
  wget -O - https://cli-assets.heroku.com/install.sh | bash -



