#!/bin/bash

# Get updated files in this project from their versions at the intended location
# Execute in a local working copy on the intended server (not checked).
#
# Parameters:
# $1: target directory, whose name should start with the server name followed by a dash (not checked)
#     default: current working directory 

TRGDIR=${1:-$(pwd)}
SUB=content

if [[ ! -d "${TRGDIR}/${SUB}" ]] ; then echo "Subdirectory ${TRGDIR}/${SUB} not found" ; exit 1 ; fi

LONG=${TRGDIR}/${SUB}/

find ${LONG} -type f | while read f ; do
	echo === $f
	if [[ $(diff -q $f /${f:${#LONG}}) ]] ; then
		echo Getting $f
		cp /${f:${#LONG}} $f
	fi
done
