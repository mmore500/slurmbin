#!/usr/bin/bash

squeue -h -u $USER --format "scontrol hold job %i"
squeue -h -u $USER --format "scontrol hold job %i" | sh

