#!/bin/bash
# /usr/bin/pkill -SIGTRAP baraction.sh
kill "$(pstree -lp | grep -- -baraction.sh\([0-9] | sed "s/.*sleep(\([0-9]\+\)).*/\1/")"
