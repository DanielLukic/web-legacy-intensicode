#!/usr/bin/env sh

# $0 : script path and name
# $* : all cmdline parameter
# $# : number of cmdline parameter

#
# FUNCTIONS
#

fail() {
  echo "ERROR: $1"
  [[ $# -eq 2 ]] && exit $2
  [[ $# -ne 2 ]] && exit 10
}

usage() {
  echo
  echo "USAGE: $0 <destination_file> <source_archive>"
  echo
  echo "Unrars the source archive to the folder of the destination"
  echo "file if the destination file does not exist."
  echo
  fail "Bad commandline", 1
}

#
# MAIN
#

# Check commandline:
[[ $# -ne 2 ]] && usage

# Store commandline parameter:
destination=$1
archive=$2
folder=`dirname $1`

# Check if destination exists and is not empty:
[[ -f $destination ]] && [[ -n `ls $destination` ]] && exit 0

# Prepare destination folder and unpack the data:
mkdir -p $folder
unrar x $2 $folder
