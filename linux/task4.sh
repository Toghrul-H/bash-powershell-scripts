#!/bin/bash
# Script: Square numbers from file
# Usage: ./task3.sh filename.txt

if test $# -ne 1; then
    echo "Please enter file"
    exit 1
fi

while read -r number; do
  if [[ $number =~ ^[0-9]+$ ]]; then
    echo $((number * number))
  else
    echo "$number is not a valid number."
  fi
done < "$1"
