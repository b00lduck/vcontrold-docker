#!/bin/bash
trap 'exit 0' SIGTERM
vcontrold $@
while true; do :; done
