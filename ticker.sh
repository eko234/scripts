#!/bin/sh
watch -n3 'kak -l | xargs -I {} kcr -s "{}" send trigger-user-hook tick'
