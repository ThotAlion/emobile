#! /bin/bash
# Derniere distribution stretch
sudo apt-get update

# instalation de ROS distribution kinetic
sudo apt-get install python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential
sudo rosdep init
rosdep update
mkdir ~/ros_catkin_ws
cd ~/ros_catkin_ws
rosinstall_generator ros_comm --rosdistro kinetic --deps --wet-only --tar > kinetic-ros_comm-wet.rosinstall
wstool init -j8 src kinetic-ros_comm-wet.rosinstall
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release
cd ..
cd ros_catkin_ws/devel_isolated/
source setup.bash
rospack profile
cd ~
echo "source ~/ros_catkin_ws/devel_isolated/setup.bash">>.bashrc