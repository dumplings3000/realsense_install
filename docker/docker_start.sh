
#!/usr/bin/env bash

BASH_OPTION=bash

IMG=iscilab/realsense_ros
containerid=$(docker ps -qf "ancestor=${IMG}") && echo $containerid

xhost +

if [[ -n "$containerid" ]]
then
    docker exec -it \
        --privileged \
        -e DISPLAY=${DISPLAY} \
        -e LINES="$(tput lines)" \
        realsense_ros \
        $BASH_OPTION
else
    docker start -i realsense_ros
fi
