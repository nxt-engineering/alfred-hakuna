#!/bin/sh

. utils.sh

load overview

overtime=$(filter .overtime)
remaining_days=$(filter .vacation.remaining_days)

echo "Your overtime as of yesterday is $overtime and you have $remaining_days vacation days remaining."

cleanup
