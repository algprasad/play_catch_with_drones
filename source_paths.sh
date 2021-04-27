#!/bin/bash
killrosgazebo
DONT_RUN=1 make /home/sid/PycharmProjects/PX4-Autopilot/px4_sitl_default gazebo
source /home/sid/PycharmProjects/PX4-Autopilot/Tools/setup_gazebo.bash /home/sid/PycharmProjects/PX4-Autopilot/ /home/sid/PycharmProjects/PX4-Autopilot/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/sid/PycharmProjects/PX4-Autopilot
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/sid/PycharmProjects/PX4-Autopilot/Tools/sitl_gazebo
roslaunch px4 drone_ball_catcher.launch &
roslaunch mavros px4.launch fcu_url:="udp://:14540@192.168.1.36:14557" &