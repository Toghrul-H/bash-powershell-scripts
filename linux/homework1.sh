#!/bin/bash
# Script: Find closest distance from log
# Usage: ./homework1.sh sample.txt

closest_distance=999999
closest_time=""

while read -r sample; do
  [[ -z "$sample" ]] && continue

  time=$(echo "$sample" | awk '{print $1}')
  dist_from=$(echo "$sample" | awk '{print $3}')
  dist_to=$(echo "$sample" | awk '{print $4}')
  dist_behind=$(echo "$sample" | awk '{print $5}')

  min_distance=$(echo "$dist_from $dist_to $dist_behind" | awk '{print ($1<$2 && $1<$3)?$1:($2<$3?$2:$3)}')

  if (( $(echo "$min_distance < $closest_distance" | bc -l) )); then
    closest_distance=$min_distance
    closest_time=$time
  fi
done < "$1"

echo "Closest point occurred at $closest_time with a distance of $closest_distance meters."
