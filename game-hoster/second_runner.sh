#!/bin/bash

SESSION_NAME="second_runner"

tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $SESSION_NAME
  echo "Tmux session '$SESSION_NAME' created."
fi
#TODO sync with first_runner !!!
SCRIPT=$1
tmux send-keys -t $SESSION_NAME "python3 $SCRIPT > second.log 2>&1" Enter
# 👇 action loop

tmux send-keys -t $SESSION_NAME "0" Enter

# A
#tmux attach-session -t $SESSION_NAME # redundant

# D
tmux detach -s $SESSION_NAME 2>/dev/null

sleep 0.5

# when done wit match
tmux kill-session -t python_runner 2>/dev/null

echo "fin"
