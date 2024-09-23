#!/usr/bin/bash

set -e
cd

tar -czvf joblog{.tar.gz,}
mv joblog/* archive/joblog

tar -czvf jobscript{.tar.gz,}
mv jobscript/* archive/jobscript

