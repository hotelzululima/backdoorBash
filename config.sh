#! /bin/bash

PORT=${PORT:-"1998"}
HOST=${HOST:-"192.168.0.11"}

LOG_SERVER=${LOG_SERVER:-"server.log"}
LOG_SERVER_ERROR=${LOG_SERVER_ERROR:-"server-error.log"}
LOG_CLIENT=${LOG_CLIENT:-"client.log"}

NC=${NC:-bin/netcat-$(uname -m)}
OPENSSL=${OPENSSL:-openssl}
SHELL=${SHELL:-/bin/bash}

CRYPT_METHOD=${CRYPT_METHOD:-"aes-128-cbc"}
PRIVKEY=${PRIVKEY:-"01020304050607080900010203040506"} # AES 128bits key	
IV=${IV:-"01020304050607080900010203040506"} # AES 128bits init vector
