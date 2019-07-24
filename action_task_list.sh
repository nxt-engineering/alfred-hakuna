#!/bin/sh

project_id=${hakuna_project_id-$1}

. utils.sh

load projects

filter \
  "{ \"items\": [
      .[] | select(.id == $project_id) |
      .tasks[] | select(.archived == false) |
        {
          \"uid\": .id,
          \"type\": \"default\",
          \"title\": .name,
          \"arg\": .id,
          \"autocomplete\": .name
        }
    ]
  }"

cleanup
