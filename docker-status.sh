#!/bin/bash

# colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# map storing container status's
declare -A containers

# different events
run() {
    containers[$1]="${GREEN}running${NC}"
    display
    update_status $1 "running"
}

stop() {
    containers[$1]="${RED}stopped${NC}"
    display
    update_status $1 "stopped"
}

pause() {
    containers[$1]="${BLUE}paused${NC}"
    display
    update_status $1 "paused"
}

destroy() {
    unset containers[$1]
    display
    update_status $1 "destroyed"
}

update_status() {
    curl https://status.neonorb.com/update_status.php --data "name=$1&status=$2" &
}

# displays the status of all the containers
display() {
    local response=""
    for name in ${!containers[@]}; do
        local status=${containers[$name]}
        response+="$name => $status\n"
    done
    clear
    echo -e "$response" | column -t
}

# gets the initial status of all the containers
while IFS=$'=' read -r -a tokens; do
    name=${tokens[0]}
    status=${tokens[1]}
    case $status in
        *Paused*)
            pause $name
            ;;
        *Up*)
            run $name
            ;;
        *)
            stop $name
            ;;
    esac
done < <(docker ps -a --format="{{.Names}}={{.Status}}")

# waits for status updates
while IFS=$'=' read -r -a tokens; do
    name=${tokens[0]}
    status=${tokens[1]}

    case $status in
        start|unpause)
            run $name
            ;;
        stop|create)
            stop $name
            ;;
        pause)
            pause $name
            ;;
        destroy)
            destroy $name
            ;;
    esac
done < <(docker events -f "type=container" --format="{{.Actor.Attributes.name}}={{.Status}}")
