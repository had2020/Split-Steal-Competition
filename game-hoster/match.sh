#!/bin/bash

#echo "Script name: $0"
#echo "Number of arguments: $#"
#echo "All arguments: $*"
#echo "All arguments (separated): $@"

#if [ $# -lt 2 ]; then
  #echo "Usage: $0 <argument1> <argument2>"
  #exit 1
#fi

#echo "First argument: $1"
#echo "Second argument: $2"

#rounds=($3)
#for round in "${rounds[@]}"; do 
    #"$@" >> temp_data.txt 
#    ./$1 >> temp_data.txt
#    echo "Round: $round" 
#done

echo "First argument (binary): $1"
echo "Second argument (rounds): $2"

# Split the rounds argument into an array
IFS=',' read -r -a rounds <<< "$2"

# Run each round
#for round in "${rounds[@]}"; do
    #echo "Running round: $round"
    # Call the Rust binary and provide input for the current round
    #./$1 <<<$round >>temp_data.txt
    #echo "Result for round $round stored in temp_data.txt"
#done

sh first_runner.sh $1
sh second_runner.sh $2
