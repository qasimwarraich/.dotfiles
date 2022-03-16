#!/bin/bash

#Bar refresh using pstree and some grep and sed.

kill "$(pstree -lp | grep sleep | sed "s/.*sleep(\([0-9]\+\)).*/\1/")"
