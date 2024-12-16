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
Should="True"
while [ $Should = "True" ]; do
  echo "counting"
  CHANGE="$(tail -n 1 "change_tracker")"
  LOG_FILE="second.log"
  LAST_LINE=$(tail -n 1 "$LOG_FILE")
  if ($CHANGE = "true") {
    echo "false" > change_tracker.txt 
    tmux send-keys -t $SESSION_NAME $LAST_LINE Enter
  }
  sleep 0.1
done

# D
tmux detach -s $SESSION_NAME 2>/dev/null

sleep 0.1

# when done wit match
tmux kill-session -t $SESSION_NAME 2>/dev/null

echo second.log > "a"
echo "fin"
