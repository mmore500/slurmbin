#!/usr/bin/bash

set -e

scontrol update JobID=$1 MailType=ALL
