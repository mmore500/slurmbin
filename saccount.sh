#!/usr/bin/bash

squeue -h -u $USER --format "scontrol update JOBID=%i ACCOUNT=$1"
squeue -h -u $USER --format "scontrol update JOBID=%i ACCOUNT=$1" | sh
