FROM mcr.microsoft.com/cstsectools/codeql-container

USER root

ARG USERNAME=john-doe
ARG DATABASE=openssl
ARG NUMBER=1
ENV USERNAME=$USERNAME
ENV DATABASE=$DATABASE
ENV NUMBER=$NUMBER

RUN ["chmod", "+x", "/usr/local/startup_scripts/setup.py"]

COPY entrypoint.sh /entrypoint.sh
COPY . /opt/

RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
