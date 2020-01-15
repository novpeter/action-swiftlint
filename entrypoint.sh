#!/bin/bash

# convert swiftlint's output into GitHub Actions Logging commands
# https://help.github.com/en/github/automating-your-workflow-with-github-actions/development-tools-for-github-actions#logging-commands

function stripPWD() {
    sed -E "s/$(pwd|sed 's/\//\\\//g')\///"
}

function convertToGitHubActionsLoggingCommands() {
    sed -E 's/^(.*):([0-9]+):([0-9]+): (warning|error|[^:]+): (.*)/::\4 file=\1,line=\2,col=\3::\5/'
}

if ! ${DIFF_BASE+false};
then
	changedFiles="-- "
	changedFiles+=$(git --no-pager diff --name-only FETCH_HEAD $(git merge-base FETCH_HEAD $DIFF_BASE) -- '*.swift')
fi

set -o pipefail && swiftlint "$@" $changedFiles | stripPWD | convertToGitHubActionsLoggingCommands
