#!/bin/sh

. utils.sh

format_time() {
  if expr "$1" : '^[0-2][0-9]:[0-5][0-9]:[0-5][0-9]$' > /dev/null; then
    echo "${1%:*}"
    return 0
  elif ! expr "$start_time" : '^[0-2][0-9]:[0-5][0-9]$' > /dev/null; then
    echo "$1"
    return 1
  else
    echo "$1"
    return 0
  fi
}

project_id=${hakuna_project_id-$1}
task_id=${hakuna_task_id-$2}
if ! start_time=$(format_time "${start_time-$3}"); then
  echo "The given time '$start_time' is not valid. The expected format is 'hh:mm' or 'hh:mm:ss'."
fi
note=${hakuna_note-${4-}}

echo \
"{
  \"project_id\": \"$project_id\",
  \"task_id\": \"$task_id\",
  \"start_time\": \"$start_time\",
  \"note\": \"$note\"
}" \
  | load timer POST @-

if filter .status > /dev/null; then
  echo "Error starting timer: $(filter .status, .message)" 1>&2
  echo "It was not possible to start the timer. Is one already running?"
  exit 1
fi

start_time=$(filter .start_time)
task=$(filter .task.name)
project=$(filter .project.name)

if code=$(filter .project.code); then
  project="[$code] $project"
fi

echo "The timer was started."
echo "Since $start_time you're now working on $task for $project."

cleanup
