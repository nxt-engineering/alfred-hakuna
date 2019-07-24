#!/bin/sh

. utils.sh

load projects

filter \
  '{ "items": [
      .[] | select(.archived == false) |
        {
          "uid": .id,
          "type": "default",
          "title": .name,
          "arg": .id,
          "autocomplete": .name
        }
    ]
  }'

cleanup
