#!/bin/bash

# Path to the state file
STATE_FILE="/tmp/last_executed"

# Check if the state file exists
if [[ ! -f $STATE_FILE ]]; then
  # If it doesn't exist, create it and execute file1
  echo "Headphones" > $STATE_FILE
  ./speakers.sh
else
  # Read the last executed file from the state file
  LAST_EXECUTED=$(cat $STATE_FILE)
  
  if [[ $LAST_EXECUTED == "Headphone audio active" ]]; then
    # If the last executed file was file1, now execute file2
    echo "Speaker audio active" > $STATE_FILE
    ./speakers.sh
  else
    # If the last executed file was file2, now execute file1
    echo "Headphone audio active" > $STATE_FILE
    ./headphones.sh
  fi
fi
