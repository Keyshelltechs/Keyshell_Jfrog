ARG BASE_IMAGE=gcr.io/${PROJECT_ID}/mvn:3.5.0-jdk-8
FROM ${BASE_IMAGE}

ARG JFROG_CLI_VERSION=1.54.1

# PR submitted to download versioned JFrog CLI

RUN apt-get update -qqy && apt-get install -qqy curl \
  && cd /tmp \
  && curl -fL https://getcli.jfrog.io | sh \
  && mv jfrog /usr/bin/ \
  && apt-get remove -qqy --purge curl \
  && rm /var/lib/apt/lists/*_*

ENTRYPOINT ["jfrog"]
