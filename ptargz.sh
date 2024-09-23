#!/usr/bin/bash

# Calculate total size and store in a variable
total_size=$(du -sbc "${@:2}" | tail -n 1 | awk '{print $1}')

# Print the total size
echo "Total size of files to be archived: $total_size bytes"

# Do the tar and gzip
tar cf - "${@:2}" -P | singularity run docker://ghcr.io/mmore500/pv -s $total_size | gzip  > $1

