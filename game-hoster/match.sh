#!/bin/bash

#echo "First argument (binary): $1"
#echo "Second argument (rounds): $2"

# split rounds argument into array
IFS=',' read -r -a rounds <<< "$2"

# run each round
#for round in "${rounds[@]}"; do
    #echo "Running round: $round"
    # Call the Rust binary and provide input for the current round
    #./$1 <<<$round >>temp_data.txt
    #echo "Result for round $round stored in temp_data.txt"
#done

sh first_runner.sh $1 &
sh second_runner.sh $2 &
