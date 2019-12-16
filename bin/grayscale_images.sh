#!/bin/bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

PROCESS_FOLDER=$1

if [ -z "$PROCESS_FOLDER" ]
then
    exit_code=1
    exit $exit_code
fi

FILES=${PROCESS_FOLDER}/*.png

for file in $FILES
do
    convert $file -colorspace Gray $file
    convert $file -resize 40 $file
    echo $file
done

set -o history -o histexpand

