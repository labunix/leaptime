#!/bin/bash
ntpq -c rv -p -n
ntptime
date '+%s'
date '+%N'
env LANG=C date -u
