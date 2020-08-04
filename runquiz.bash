#!/bin/bash
# Bash script which launches the rosignite quizzes
# Arguments
# ---------
# $1 = unit
# $2 = package
# $3 = launch file
#let script exit if a command fails
set -o errexit 
#let script exit if an unsed variable is used
set -o nounset


function main(){
    if [ ! -d "$1/devel" ]; then
        cd "$1/src" && catkin_init_workspace && cd .. && catkin_make
    fi
    source "$1/devel/setup.bash"
    roslaunch "$2" "$3"
}

main "$@"
