#!/bin/sh

# Copyright (c) 2016 Franco Fichtner <franco@opnsense.org>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

set -e

SELF=rename

. ./common.sh && $(${SCRUB_ARGS})

for ARG in ${@}; do
	case ${ARG} in
	base)
		echo ">>> Renaming base set: ${NAME}"
		for FILE in $(find ${SETSDIR} -name \
		    "base-*-${PRODUCT_ARCH}.*"); do
			mv ${FILE} ${SETSDIR}/base-${NAME}-${FILE##*-}
		done
		;;
	kernel)
		echo ">>> Renaming kernel set: ${NAME}"
		for FILE in $(find ${SETSDIR} -name \
		    "kernel-*-${PRODUCT_ARCH}.*"); do
			mv ${FILE} ${SETSDIR}/kernel-${NAME}-${FILE##*-}
		done
		;;
	esac
done
