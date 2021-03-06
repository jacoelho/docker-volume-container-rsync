FROM ubuntu:trusty
MAINTAINER TANABE Ken-ichi <nabeken@tknetworks.org>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq rsync && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

EXPOSE 873
VOLUME /docker
ADD ./run /usr/local/bin/run

ENTRYPOINT ["/usr/local/bin/run"]
