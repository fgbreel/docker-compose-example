FROM debian:testing

RUN apt-get update \
  && apt-get -y --no-install-recommends install \
    netcat \
    python3 \
    default-mysql-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/bin/

EXPOSE "8000"
ENTRYPOINT ["entrypoint.sh"]
