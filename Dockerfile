# Container image that runs your code
# FROM j3ssie/codeql-base:latest
FROM mcr.microsoft.com/cstsectools/codeql-container

USER root

ENV CODEQL_CLI_ARGS="database analyze /opt/databases/openssl --format=sarif-latest --output=/opt/output/john-doe-result.sarif /opt/queries/john-doe/"

RUN ["chmod", "+x", "/usr/local/startup_scripts/setup.py"]

COPY . /opt/

RUN cd /opt/queries/john-doe && codeql pack install

# FROM ubuntu:20.04 AS codeql_base
# LABEL maintainer="Github codeql team"

# # tzdata install needs to be non-interactive
# ENV DEBIAN_FRONTEND=noninteractive

# # install/update basics and python
# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y --no-install-recommends \
#     	software-properties-common \
#     	vim \
#     	curl \
#     	wget \
#     	git \
#     	jq \
#     	build-essential \
#     	unzip \
#     	apt-transport-https \
#         python3.8 \
#     	python3-venv \
#     	python3-pip \
#     	python3-setuptools \
#         python3-dev \
#     	gnupg \
#     	g++ \
#     	make \
#     	gcc \
#     	apt-utils \
#         rsync \
#     	file \
#         dos2unix \
#         default-jdk \
#     	gettext
# # support typescript
# RUN apt-get install nodejs -y -qq
# RUN apt-get clean && \
#         ln -sf /usr/bin/python3.8 /usr/bin/python && \
#         ln -sf /usr/bin/pip3 /usr/bin/pip 

# # Install Golang
# RUN wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash

# # Install latest codeQL
# ENV CODEQL_HOME /root/codeql-home

# # Get CodeQL verion
# RUN curl --silent "https://api.github.com/repos/github/codeql-cli-binaries/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' > /tmp/codeql_version

# # record the latest version of the codeql-cli
# RUN mkdir -p ${CODEQL_HOME} \
#     ${CODEQL_HOME}/codeql-repo \
#     ${CODEQL_HOME}/codeql-go-repo \
#     /opt/codeql

# # get the latest codeql queries and record the HEAD
# RUN git clone --depth=1 https://github.com/github/codeql ${CODEQL_HOME}/codeql-repo && \
#     git --git-dir ${CODEQL_HOME}/codeql-repo/.git log --pretty=reference -1 > /opt/codeql/codeql-repo-last-commit

# RUN CODEQL_VERSION=$(cat /tmp/codeql_version) && \
#     wget -q https://github.com/github/codeql-cli-binaries/releases/download/${CODEQL_VERSION}/codeql-linux64.zip -O /tmp/codeql_linux.zip && \
#     unzip /tmp/codeql_linux.zip -d ${CODEQL_HOME} && \
#     rm /tmp/codeql_linux.zip

# ENV PATH="$PATH:${CODEQL_HOME}/codeql:/root/go/bin:/root/.go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# COPY containers /root/containers
# # Pre-compile our queries to save time later
# RUN /root/containers/compile-qs.sh



# ENV CODEQL_HOME /root/codeql-home
# ENV PATH="$PATH:${CODEQL_HOME}/codeql:/root/go/bin:/root/.go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# COPY . /root/src

# RUN apk --update add openssl wget unzip && rm -rf /var/cache/apk/*

# # RUN wget https://github.com/github/codeql-action/releases/download/codeql-bundle-20230403/codeql-bundle-linux64.tar.gz

# # RUN tar -xvzf codeql-bundle-linux64.tar.gz
# RUN cd /root/src/queries && codeql pack install
# RUN codeql database analyze /root/src/codeql_db --format=sarif-latest --output=/root/output.sarif /root/src/queries

# RUN ls -a
# RUN cd codeql
# RUN ls -a

# # Copies your code file from your action repository to the filesystem path `/` of the container
# COPY entrypoint.sh /entrypoint.sh
# # COPY codeql-bundle-linux64 codeql

# # Code file to execute when the docker container starts up (`entrypoint.sh`)
# ENTRYPOINT ["/entrypoint.sh"]
