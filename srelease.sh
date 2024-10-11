#!/usr/bin/bash

squeue -h -u $USER --format "scontrol release %i"
squeue -h -u $USER --format "scontrol release %i" | sh

