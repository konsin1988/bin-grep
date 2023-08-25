#!/bin/bash
# bin-grep.sh: binary string search
#
# Analogue to "grep -a"
#
E_BADARGS=65
E_NOFILE=66

if [ $# -ne 2 ]
then
	echo "How to use: `basename $0` string filename"
	exit $E_BADARGS
fi

if [ ! -f "$2" ]
then 
	echo "File \"$2\" not found."
	exit $E_NOFILE
fi

for word in $( strings "$2" | grep "$1")
do
	echo $word
done

