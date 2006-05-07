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
  echo "USAGE: $0 <target> <source>"
  echo
  echo "Downloads the target from the source if it isnt present"
  echo "already. Uses the .credentials file to logint (via basic"
  echo "auth)."
  echo
  fail "Bad commandline", 1
}

credentials() {
  echo
  echo "Missing '${credentials_file}' file. Please see 'installation'"
  echo "folder for examples!"
  echo
  fail "Missing SSh/CVS credentials", 10
}

#
# MAIN
#

# Check commandline:
[[ $# -ne 2 ]] && usage

# Store commandline parameter:
target=$1
source=$2

# Check if target exists:
[[ -f ${target} ]] && [[ -s ${target} ]] && exit 0

# Read credentials file and/or use default settings:
credentials_file=".credentials"
credentials_cfg="LOGIN: guest:none"
host="212.63.90.10"
port="22"

[[ ! -f ${credentials_file} ]] && credentials

[[ -f ${credentials_file} ]] && credentials_cfg=`grep "LOGIN:" ${credentials_file}`
[[ -f ${credentials_file} ]] && host_cfg=`grep "HOST:" ${credentials_file}`
[[ -f ${credentials_file} ]] && port_cfg=`grep "PORT:" ${credentials_file}`
[[ -n ${credentials_cfg} ]] && username=`echo ${credentials_cfg} | sed "s/[ \t]*LOGIN: \([^:]\+\):.\+/\1/"`
[[ -n ${credentials_cfg} ]] && password=`echo ${credentials_cfg} | sed "s/[ \t]*LOGIN: [^:]\+:\(.\+\)/\1/"`
[[ -n ${host_cfg} ]] && host=`echo ${host_cfg} | sed "s/[ \t]*HOST: //"`
[[ -n ${port_cfg} ]] && port=`echo ${port_cfg} | sed "s/[ \t]*PORT: //"`

# Prepare destination folder and download the data:
mkdir -p `dirname ${target}`
pscp -P "${port}" -l "${username}" -pw "${password}" "${host}:/home/cvs/repository/SUPPORT_DATA/Rubium/${source}" "${target}"
