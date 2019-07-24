#!/bin/bash

# brew workaround
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

tmpfile=$(mktemp)

load() {
  request_data=${3-}
  http_method=${2-GET}
  api_call=$1

  if [ "$request_data" != "" ]; then
    request_data=( "-d" "$request_data" )
    content_type=( "-H" "Content-Type: application/json" )
  else
    request_data=()
    content_type=()
  fi

  # shellcheck disable=SC2154
  curl -s \
    -o "$tmpfile" \
    "${request_data[@]}" \
    "-X$http_method" \
    -H "X-Auth-Token: ${hakuna_api_key}" \
    "${content_type[@]}" \
    "${hakuna_base_url}/api/v1/$api_call"

  # DEBUG
  tee /tmp/out 1>&2 < "$tmpfile"
}

filter() {
  jq -cerM "$1" < "$tmpfile"
  return $?
}

cleanup() {
  rm -f "$tmpfile"
}
