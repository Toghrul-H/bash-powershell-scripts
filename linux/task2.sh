#!/bin/bash
# Script: Find highest and lowest marks
# Usage: ./task2.sh

echo "Enter marks separated by spaces:"
read -a marks

highest=${marks[0]}
lowest=${marks[0]}

for mark in "${marks[@]}"; do
  (( mark > highest )) && highest=$mark
  (( mark < lowest )) && lowest=$mark
done

echo "Highest mark: $highest"
echo "Lowest mark: $lowest"