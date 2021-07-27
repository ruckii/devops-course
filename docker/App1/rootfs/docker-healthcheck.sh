#!/bin/sh
set -eo pipefail

# just test that the port is open
if nc -w 1 -z "127.0.0.1" 8081 ; then
    exit 0
fi

exit 1