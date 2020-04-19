#!/usr/bin/env bash

# Script retrieves all teams from the ctf

for i in $(seq 0 1 38);
  do curl -s "https://ctf.wpictf.xyz/teams?page=$i";
done | grep "teams/" -A 1 > teams.txt

# Explanation: The hint suggests blue team (blue team is defensive security team) --> This means we should look for the WPI team
# Solution: cat teams.txt | grep "WPI"
