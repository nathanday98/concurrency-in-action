#!/bin/bash

array=( $@ )
len=${#array[@]}
_output=${array[$len-1]}
_inputs=${array[@]:0:$len-1}

# echo "$_inputs"
# echo "$_output"

sed -e '1s/^/[\'$'\n''/' -e '$s/,$/\'$'\n'']/' $_inputs > $_output
