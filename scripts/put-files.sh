#!/bin/bash

# Shoots content files to their intended location
# Execute as root (checked).
# Execute in a local working copy on the intended server (checked).
# Overwrites previous content files but does not delete extra files at the destination.
#
# Parameters:
# $1: source directory, whose name should start with the server name followed by a dash (checked)
#     default: current working directory 

cut_at_first()
{
	local INPUT=$1
	local I=$(expr index ${INPUT} $2)
	if [[ ${I} -gt 0 ]] ; then INPUT=${INPUT:0:${I}-1} ; fi
	echo ${INPUT}
}

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 2 ; fi

SRCDIR=${1:-$(pwd)}
SRCDIRBASE=$(basename ${SRCDIR})
HOSTNAME=$(hostname)
SERVER_FROM_SRCDIR=$(cut_at_first ${SRCDIRBASE} -)
SERVER_FROM_HOSTNAME=$(cut_at_first ${HOSTNAME} .)

if [[ ${SERVER_FROM_SRCDIR} != ${SERVER_FROM_HOSTNAME} ]] ; then echo "Directory ${SRCDIRBASE} is not intended for server ${HOSTNAME}" ; exit 2 ; fi


SUB=content

if [[ ! -d "${SRCDIR}/${SUB}" ]] ; then echo "Subdirectory ${SRCDIR}/${SUB} not found" ; exit 1 ; fi

rsync -rtv ${SRCDIR}/${SUB}/ /
