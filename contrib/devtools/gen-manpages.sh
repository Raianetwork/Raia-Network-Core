#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

RAIANETWORKD=${RAIANETWORKD:-$SRCDIR/raianetworkd}
RAIANETWORKCLI=${RAIANETWORKCLI:-$SRCDIR/raianetwork-cli}
RAIANETWORKTX=${RAIANETWORKTX:-$SRCDIR/raianetwork-tx}
RAIANETWORKQT=${RAIANETWORKQT:-$SRCDIR/qt/raianetwork-qt}

[ ! -x $RAIANETWORKD ] && echo "$RAIANETWORKD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
RAIAVER=($($RAIANETWORKCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for raianetworkd if --version-string is not set,
# but has different outcomes for raianetwork-qt and raianetwork-cli.
echo "[COPYRIGHT]" > footer.h2m
$RAIANETWORKD --version | sed -n '1!p' >> footer.h2m

for cmd in $RAIANETWORKD $RAIANETWORKCLI $RAIANETWORKTX $RAIANETWORKQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${RAIAVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${RAIAVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
