#!/bin/bash

# Get common files from ../common-gluu and adapt them for the corresponding gluu server.
# Execute in this directory.

TRGDIR=$(pwd)
SRCDIR=${TRGDIR}/../common-gluu
SUB=content

SRC=${SRCDIR}/${SUB}
TRG=${TRGDIR}/${SUB}

if [[ ! -d "${SRC}" ]] ; then echo "Subdirectory ${SRC} not found" ; exit 1 ; fi
if [[ ! -d "${TRG}" ]] ; then echo "Subdirectory ${TRG} not found" ; exit 1 ; fi

# The files we consider should be git-ignored. Let's clean files copied in previous run:
git clean -fdX

rsync -rtv ${SRC}/ ${TRG}

find ${TRG} -type f | while read f ; do grep -l 'to-be-replaced' $f ; done | while read g ; do
	sed --in-place -f - << _EOF $g
s/to-be-replaced-gluu-server-and-port/tcblsso.ilabt.iminds.be/g
s/to-be-replaced-tudm-server-and-port/tcblsso.ilabt.iminds.be/g
_EOF
done