#!/bin/bash

CATS="/tmp/work"

mkdir -p $CATS

cd $CATS

find / -type d > $CATS/myfile.txt

for LINE in `cat $CATS/myfile.txt`
do
	mkdir $CATS$LINE
done

cd /tmp

tar -jcf files.tbz2 ./work

exit 0
