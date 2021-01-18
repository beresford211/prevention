#!/bin/sh

FILENAME="com.hosteditor.blocker"

cp ${FILENAME} /Library/LaunchDaemons

launchctl load -w /Library/LaunchDaemons/${FILENAME}
