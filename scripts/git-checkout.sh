#!/bin/sh

if test $# -lt 3; then
	echo "Usage: $0 <tree> <tag> <dir>"
	exit 1
fi
# ssh -L 1080:xenbits.xen.org:9418 ubuntu@gpt.delayboy.cn
#git://localhost:1080/qemu-upstream-4.6-testing.git
TREE=https://github.com/delayboy/qemu-upstream-4.6-testing.git
TAG=$2
DIR=$3

set -e

if test \! -d $DIR-remote; then
	rm -rf $DIR-remote $DIR-remote.tmp
	mkdir -p $DIR-remote.tmp; rmdir $DIR-remote.tmp
	$GIT clone $TREE $DIR-remote.tmp
	#if test "$TAG" ; then
	#	cd $DIR-remote.tmp
	#	$GIT branch -D dummy >/dev/null 2>&1 ||:
	#	$GIT checkout -b dummy $TAG
	#	cd ..
	#fi
	mv $DIR-remote.tmp $DIR-remote
fi
rm -f $DIR
ln -sf $DIR-remote $DIR
