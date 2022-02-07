#!/usr/bin/env bash
awk -F"TAG" '{print $2, $1}' $@
