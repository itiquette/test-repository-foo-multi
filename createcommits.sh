#!/bin/bash

# Loop 5000 times
for i in {1..5000}; do
  # Generate random string and save to file
  # Using /dev/urandom for true randomness, converting to base64, and taking first 300 characters
  head -c 300 /dev/urandom | base64 >"random_file_$i.txt"

  # Add the new file to git
  git add "random_file_$i.txt"

  # Create a commit with a numbered message
  git commit -m "Random commit number $i"

  # Optional: print progress every 100 commits
  if [ $((i % 100)) -eq 0 ]; then
    echo "Created $i commits"
  fi
done
