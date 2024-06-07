#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Path to the state file
STATE_FILE="$SCRIPT_DIR/last_executed"

# Check if the state file exists
if [[ ! -f $STATE_FILE ]]; then
  # If it doesn't exist, create it and execute it
  echo "Speakers" > $STATE_FILE
  "$SCRIPT_DIR/speakers.sh"
else
  # Read the last executed file from the state file
  LAST_EXECUTED=$(cat $STATE_FILE)
  
  if [[ $LAST_EXECUTED == "Speakers" ]]; then
    # If the last executed file was file1, now execute headphones.sh
    echo "headphones" > $STATE_FILE
    "$SCRIPT_DIR/headphones.sh"
  else
    # If the last executed file was headphones.sh, now execute speakers.sh
    echo "Speakers" > $STATE_FILE
    "$SCRIPT_DIR/speakers.sh"
  fi
fi
