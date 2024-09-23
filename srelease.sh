#!/usr/bin/bash

squeue -h -u $USER --format "scontrol release job %i"
squeue -h -u $USER --format "scontrol release job %i" | sh

