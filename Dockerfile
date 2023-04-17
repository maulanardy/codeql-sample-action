# Container image that runs your code
FROM alpine:3.10

RUN apk --update add openssl wget unzip && rm -rf /var/cache/apk/*

RUN wget https://github.com/github/codeql-action/releases/download/codeql-bundle-20230403/codeql-bundle-linux64.tar.gz

RUN tar -xvzf ./codeql-bundle-linux64.tar.gz -C ./codeql

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY ./codeql /codeql

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
