#!/bin/bash
set -e
cd $(dirname $0)

mkdir -p output input
python3 make_seeds.py input
afl-fuzz -i input -o output ./fuzzer @@
