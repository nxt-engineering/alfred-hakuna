#!/bin/sh

. utils.sh

format_time() {
  if expr "$1" : '^[0-2][0-9]:[0-5][0-9]:[0-5][0-9]$' > /dev/null; then
    echo "${1%:*}"
    return 0
  elif ! expr "$end_time" : '^[0-2][0-9]:[0-5][0-9]$' > /dev/null; then
    echo "$1"
    return 1
  else
    echo "$1"
    return 0
  fi
}

if ! end_time=$(format_time "${end_time-$1}"); then
  echo "The given time '$end_time' is not valid. The expected format is 'hh:mm' or 'hh:mm:ss'."
  exit 1
fi

echo \
"{
  \"end_time\": \"$end_time\"
}" \
  | load timer PUT @-

if filter .error > /dev/null; then
  echo "Currently there is no running timer to stop."
  exit 1
fi

start_time=$(filter .start_time)
end_time=$(filter .end_time)
duration=$(filter .duration)
task=$(filter .task.name)
project=$(filter .project.name)

if code=$(filter .project.code); then
  project="[$code] $project"
fi

echo "The timer was stopped."
echo "You've spent $duration on $task for $project from $start_time until $end_time."

cleanup
