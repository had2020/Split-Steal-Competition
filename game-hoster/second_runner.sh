#!/bin/bash

SESSION_NAME="second_runner"

tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $SESSION_NAME
  echo "Tmux session '$SESSION_NAME' created."
fi

SCRIPT=$1
#tmux send-keys -t $SESSION_NAME "python3 $SCRIPT > first.log 2>&1" Enter
file_path="$1"
extension="${file_path##*.}"
if [ "$extension" = "py" ]; then
    tmux send-keys -t $SESSION_NAME "python3 $SCRIPT > second.log 2>&1" Enter
else
    tmux send-keys -t $SESSION_NAME "./$SCRIPT > second.log 2>&1" Enter
fi

# 👇 action loop
max_attempts=10
attempts=10
counter=0
Should="True"
Changed="True"

while [ $Should = "True" ]; do
  if [ $attempts -ge $max_attempts ]; then
    echo "p2round"

    CHANGE="$(tail -n 1 "change_tracker2.txt")"
    echo "first change: $CHANGE"

    LOG_FILE="second.log"
    LAST_LINE=$(tail -n 1 "$LOG_FILE")

    if [ "$CHANGE" = "True" ]; then
      echo "false" > change_tracker.txt 

      if [ -z "$LAST_LINE" ]; then
        echo "NULL value"
      else
        tmux send-keys -t $SESSION_NAME $LAST_LINE Enter
      fi
      echo "true" > change_tracker2.txt
      Changed="True"
    fi

    sleep 0.1

    if [ "$Changed" = "True" ]; then
      Changed="False"
      echo "rounds: $2"
      echo "$counter"
      if [ "$2" = "$counter" ]; then
        Should="False"
      else
        change=$((counter + 1))
        counter=$change
        echo "$counter"
      fi
    fi

    attempts=$((attempts + 1))
    echo "$attempts"
  else
    Should="False"
  fi
  #Should="False" #Debuging with only singler round
done

# D
tmux detach -s $SESSION_NAME 2>/dev/null

sleep 0.1

# when done wit match
tmux kill-session -t $SESSION_NAME 2>/dev/null

echo "" > second.log
echo "false" > change_tracker2.txt
#echo second.log > "a"