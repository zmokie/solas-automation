#!/bin/bash
LOGFILE="$HOME/solas-automation/process.log"
GITPATH="$HOME/solas-automation"

while true; do
  echo "$(date '+%Y-%m-%d %H:%M:%S') – Process check started" >> $LOGFILE

  # Her legges dine oppgaver:
  bash $GITPATH/tasks/run_all.sh >> $LOGFILE 2>&1

  cd $GITPATH
  git add .
  git commit -m "Auto-log update $(date '+%H:%M:%S')" >/dev/null 2>&1
  git push origin main >/dev/null 2>&1

  sleep 600
done
