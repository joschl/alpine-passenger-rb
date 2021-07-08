#!/bin/sh

set -ex

env

passenger start --port $PORT --no-install-runtime --no-compile-runtime
