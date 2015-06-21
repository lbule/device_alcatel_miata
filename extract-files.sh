#!/bin/sh

set -e

VENDOR=alcatel
DEVICE=miata

if [ $# -eq 0 ]; then
  SRC=adb
else
  if [ $# -eq 1 ]; then
    SRC=$1
  else
    echo "$0: bad number of arguments"
    echo ""
    echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
    echo ""
    echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
    echo "the device using adb pull."
    exit 1
  fi
fi

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^- | grep -v ^$ | sed -e 's#^/system/##g'`; do
#	echo $FILE
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    if [ "$SRC" = "adb" ]; then
      adb pull /system/$FILE $BASE/$FILE
    else
    	if [ -f "$SRC/system/$FILE" ]; then
      		cp $SRC/system/$FILE $BASE/$FILE
      	else
      		echo "not found: $SRC/system/$FILE"
      	fi
    fi

done

#./setup-makefiles.sh
