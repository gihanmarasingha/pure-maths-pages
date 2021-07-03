#!/usr/bin/env bash

trap 'rm -f "$TMPFILE"' EXIT

TMPFILE=$(mktemp) || exit

if grep -q "Global site tag (gtag\.js) - Google Analytics" html/index.html; then
	echo "Tracker not inserted"
else
	cat google_tracker.txt > $TMPFILE;
	tail -n +4 html/index.html >> $TMPFILE
	cp $TMPFILE html/index.html
	echo "Tracker inserted"
fi
