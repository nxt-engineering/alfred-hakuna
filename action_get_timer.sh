#!/bin/sh

. utils.sh

load timer

if ! start_time=$(filter .start_time); then
  echo "Currently there is no running timer to show."
  exit 1
fi

duration=$(filter .duration)
task=$(filter .task.name)
project=$(filter .project.name)

if code=$(filter .project.code); then
  project="[$code] $project"
fi

echo "You've spent $duration on $task for $project since $start_time."

cleanup
