#!/bin/sh -l

USERNAME=$1

cd /action
echo "creating docker image for user: $USERNAME"

# here we can make the construction of the image as customizable as we need
# and if we need parameterizable values it is a matter of sending them as inputs
docker build -t qcve/action --build-arg USERNAME="$USERNAME" . && docker run -v 'd:/Works/Moonlay/Shannon/qcve/codeql-sample-action/output':/opt/output qcve/action