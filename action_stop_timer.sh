#!/bin/sh

. utils.sh

load timer PUT

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
