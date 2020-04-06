#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

set -e
cd $(dirname $0)
LIBPYTHON_PATH=cpython/libpython3.9.a
if [ ! -f $LIBPYTHON_PATH ]; then
	pushd cpython
	./configure CC="afl-gcc"
	make; make install
	popd
fi

afl-gcc -o fuzzer -g -I./cpython -I./cpython/Include -lutil harness.c $LIBPYTHON_PATH
afl-gcc -o tester -g -I./cpython -I./cpython/Include -lutil tester.c $LIBPYTHON_PATH
