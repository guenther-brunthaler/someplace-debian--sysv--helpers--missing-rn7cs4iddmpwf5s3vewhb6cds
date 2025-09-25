#! /bin/sh

# v2025.268
set -e
trap 'test $? = 0 || echo "\"$0\" failed!" >& 2' 0
find . -path './*/DEBIAN/control' \
| while IFS= read -r f
do
	f=`dirname -- "$f"`
	f=`dirname -- "$f"`
	f=`basename -- "$f"`
	dpkg-deb -b -- "$f"
	dpkg-name -o -- "$f.deb"
done
