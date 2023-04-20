#!/bin/sh -l

echo "analyzing query from: $USERNAME"

cd /opt/queries && codeql pack install

# here we can make the construction of the image as customizable as we need
# and if we need parameterizable values it is a matter of sending them as inputs
codeql database analyze /opt/databases/openssl --format=sarif-latest --output=/opt/output/$USERNAME-result.sarif /opt/queries/