# realsense_install
install realsense_ros(ROS1) in ubuntu20.04
1. create docker container
```
cd catkin_ws/src
git clone https://github.com/dumplings3000/realsense_install.git
cd realsense_install/docker
source build.sh
source docker_run.sh
```
2. install realsense_ros in docker container
```
cd catkin_ws/src/realsense_install
source install.sh
```
