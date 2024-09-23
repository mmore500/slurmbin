#!/usr/bin/bash

squeue -h -u $USER --format "scontrol update JOBID=%i ReqNodeList=$1"
squeue -h -u $USER --format "scontrol update JOBID=%i ReqNodeList=$1" | sh
