#!/bin/bash -ex
mkdir -p out/bin out/lib out/lib64
cp /lib64/ld-linux-x86-64.so.2 out/lib64
for bin in `cat bin.txt`
do
	bin=`which $bin`
	cp $bin out/bin
	for lib in `ldd $bin | awk '/=>/{print $3}'`
	do
		libs="$libs\n$lib"
	done
done
libs=`echo -e $libs | sort -u`
for lib in $libs
do
	cp $lib out/lib
done
