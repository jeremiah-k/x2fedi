#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <X.com_or_Twitter.com_link>"
    exit 1
fi

link=$1

# Extract the username and status ID using regex
if [[ $link =~ https://(x\.com|twitter\.com)/([^/]+)/status/([0-9]+) ]]; then
    username=$(echo "${BASH_REMATCH[2]}" | tr '[:upper:]' '[:lower:]')
    status_id=${BASH_REMATCH[3]}
    bird_makeup_link="https://bird.makeup/users/$username/statuses/$status_id"
    echo $bird_makeup_link
else
    echo "Invalid X.com or Twitter.com link"
    exit 1
fi
