#!/bin/bash

# Compare content files in this project to their versions at the intended location
# Execute in a local working copy on the intended server (not checked).
#
# Parameters:
# $1: source directory, whose name should start with the server name followed by a dash (not checked)
#     default: current working directory 

SRCDIR=${1:-$(pwd)}
SUB=content

if [[ ! -d "${SRCDIR}/${SUB}" ]] ; then echo "Subdirectory ${SRCDIR}/${SUB} not found" ; exit 1 ; fi

LONG=${SRCDIR}/${SUB}/

find ${LONG} -type f | while read f ; do echo === $f ; diff $f /${f:${#LONG}} ; done
