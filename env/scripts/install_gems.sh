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
  echo "USAGE: $0 <folder_with_gems>"
  echo
  echo "Install all gems found in the specified folder."
  echo
  fail "Bad commandline", 1
}

#
# MAIN
#

# Check commandline:
[[ $# -ne 1 ]] && usage

# Store commandline parameter:
gems_folder=$1

# Check if gems folder exists and is a folder:
[[ ! -d $gems_folder ]] && exit 0

# Find gems and install them:
for gem in $gems_folder/*.gem
do
    ruby -S gem install $gem
done
