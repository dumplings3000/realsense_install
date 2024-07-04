#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the directory
REALSENSE_install_DIR=~/catkin_ws/src
REALSENSE_DIR=~/catkin_ws/src/realsense-ros

cd $REALSENSE_install_DIR

# Clone the repository
git clone https://github.com/IntelRealSense/realsense-ros.git -b ros1-legacy

git config --global --add safe.directory $REALSENSE_DIR
cd $REALSENSE_DIR
git checkout $(git tag | sort -V | grep -P "^2.\d+\.\d+" | tail -1)
cd ..

# Initialize the catkin workspace
catkin_init_workspace
cd ..
catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release
catkin_make install

# Add source command to .bashrc if not already present
if ! grep -qxF 'source ~/catkin_ws/devel/setup.bash' ~/.bashrc; then
    echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc
fi

# Source the setup.bash file
source ~/.bashrc
echo "Setup complete."
