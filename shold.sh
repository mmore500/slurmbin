#!/usr/bin/bash

squeue -h -u $USER --format "scontrol hold %i &"
squeue -h -u $USER --format "scontrol hold %i &" | sh

