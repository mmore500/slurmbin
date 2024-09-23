#!/usr/bin/bash

find joblog -type f | while read file; do
    if grep -q "CANCELLED" "$file"; then
        job_number=$(echo "$file" | grep -o '[0-9]\+')
        echo scontrol requeue "$job_number"
        # scontrol requeue "$job_number"
        
        sbatch jobscript/*$job_number*
    fi
done

