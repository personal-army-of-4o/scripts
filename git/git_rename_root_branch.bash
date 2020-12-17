#!/bin/bash

usage () {
    echo "usage:"
	echo "$0 <old branch name> <new branch name>"
}

try () {
	eval $1
	if [ "$?" != "0" ]; then
		echo "command $1 failed"
		exit 1
	fi
}

if [ "$1" == "" ]; then
	usage
	exit 1
fi

if [ "$2" == "" ]; then
	usage
	exit 1
fi

try "git checkout $1"
try "git branch -m $2"
try "git push --set-upstream origin $2"

