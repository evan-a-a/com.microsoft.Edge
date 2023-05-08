#!/usr/bin/sh

set -e

bsdtar -Oxf edge.deb 'data.tar*' |
  bsdtar -xf - \
    --strip-components=4 \
    --exclude='./opt/microsoft/msedge-beta/nacl*' \
    ./opt/microsoft/msedge-beta
rm edge.deb

bsdtar -Oxf msalsdk.deb 'data.tar*' |
  bsdtar -xf - \
    --strip-components=3 \
    ./usr/lib
rm msalsdk.deb

install -Dm755 /app/bin/stub_sandbox msedge-sandbox
