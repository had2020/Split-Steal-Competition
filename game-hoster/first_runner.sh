#!/bin/bash

SESSION_NAME="first_runner"

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
    tmux send-keys -t $SESSION_NAME "python3 $SCRIPT > first.log 2>&1" Enter
else
    tmux send-keys -t $SESSION_NAME "./$SCRIPT > first.log 2>&1" Enter
fi

# 👇 action loop
echo "true" > change_tracker.txt 

# round loop
tmux send-keys -t $SESSION_NAME "0" Enter
tmux send-keys -t $SESSION_NAME "0" Enter
tmux send-keys -t $SESSION_NAME "0" Enter

LOG_FILE="second.log"
LAST_LINE=$(tail -n 1 "$LOG_FILE")
echo "Last log line:"
echo "$LAST_LINE"

# D
tmux detach -s $SESSION_NAME 2>/dev/null

sleep 0.1
echo "false" > change_tracker.txt 

# when done wit match
tmux kill-session -t $SESSION_NAME 2>/dev/null

echo "" > first.log
echo "fin"
