/**
 * @file offb_node.cpp
 * @brief Offboard control example node, written with MAVROS version 0.19.x, PX4 Pro Flight
 * Stack and tested in Gazebo SITL
 */

#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/TwistStamped.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
//#include "position_control_cpp/set_position.h"
geometry_msgs::PoseStamped cmd_position;


geometry_msgs::TwistStamped cmd_vel;
geometry_msgs::PoseStamped current_pose;

bool new_position_cmd = false, new_velocity_cmd = false, new_current_pose = false;
mavros_msgs::State current_state;
void state_cb(const mavros_msgs::State::ConstPtr& msg){
    current_state = *msg;
}
// TODO: Offer two services here: 1) setting the position 2) setting the velocity
void cmdVelCallback(const geometry_msgs::TwistConstPtr& msg){
    cmd_vel.twist.linear.x = msg->linear.x;
    cmd_vel.twist.linear.y = msg->linear.y;
    cmd_vel.twist.linear.z = msg->linear.z;
    new_velocity_cmd = true;
    ROS_INFO("Recieved command vel");

}

void cmdPosCallback(const geometry_msgs::PoseConstPtr& msg){
    cmd_position.pose.position.x = msg->position.x;
    cmd_position.pose.position.x = msg->position.y;
    cmd_position.pose.position.z = msg->position.z;
    new_position_cmd = true;
    ROS_INFO("recieved command position");
}

void setCmdVel2Zero(){
    cmd_vel.twist.linear.x = 0;
    cmd_vel.twist.linear.y = 0;
    cmd_vel.twist.linear.z = 0;


}
void posCallback(const geometry_msgs::PoseStampedConstPtr& msg){
    current_pose.pose.position.x = msg->pose.position.x;
    current_pose.pose.position.y = msg->pose.position.y;
    current_pose.pose.position.z = msg->pose.position.z;
    new_current_pose = true;

}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "offb_node");
    ros::NodeHandle nh;

    ros::Subscriber state_sub = nh.subscribe<mavros_msgs::State>
            ("mavros/state", 10, state_cb);
    ros::Publisher local_pos_pub = nh.advertise<geometry_msgs::PoseStamped>
            ("mavros/setpoint_position/local", 10);
    ros::Publisher local_vel_pub = nh.advertise<geometry_msgs::TwistStamped>
            ("/mavros/setpoint_velocity/cmd_vel", 10);
    ros::ServiceClient arming_client = nh.serviceClient<mavros_msgs::CommandBool>
            ("mavros/cmd/arming");
    ros::ServiceClient set_mode_client = nh.serviceClient<mavros_msgs::SetMode>
            ("mavros/set_mode");


    //subscribe to velocity and position commands from the python file
    ros::Subscriber sub_velocity_cmd = nh.subscribe<geometry_msgs::Twist>
            ("position_control_cpp/cmd_vel", 1000, cmdVelCallback);
    ros::Subscriber sub_position_cmd = nh.subscribe<geometry_msgs::Pose>
            ("position_control_cpp/cmd_pos", 1000, cmdPosCallback);

    //subscribe to current position
    ros::Subscriber sub_position = nh.subscribe<geometry_msgs::PoseStamped>
            ("/mavros/local_position/pose", 10, posCallback);

    //the setpoint publishing rate MUST be faster than 2Hz
    ros::Rate rate(20.0);

    // wait for FCU connection
    while(ros::ok() && !current_state.connected && new_current_pose){
        ros::spinOnce();
        rate.sleep();
    }

    cmd_position.pose.position.x = 0;
    cmd_position.pose.position.y = 0;
    cmd_position.pose.position.z = 2;

    cmd_vel.twist.linear.x = 0.0;
    cmd_vel.twist.linear.z = 0.0;

    //setting an initial value of current pose


    //send a few setpoints before starting
    for(int i = 100; ros::ok() && i > 0; --i){
        local_pos_pub.publish(cmd_position);
        ros::spinOnce();
        rate.sleep();
    }

    mavros_msgs::SetMode offb_set_mode;
    offb_set_mode.request.custom_mode = "OFFBOARD";

    mavros_msgs::CommandBool arm_cmd;
    arm_cmd.request.value = true;

    ros::Time last_request = ros::Time::now();
    int i = 0;
    while(ros::ok()){
        if( current_state.mode != "OFFBOARD" &&
            (ros::Time::now() - last_request > ros::Duration(5.0))){
            if( set_mode_client.call(offb_set_mode) &&
                offb_set_mode.response.mode_sent){
                ROS_INFO("Offboard enabled");
            }
            last_request = ros::Time::now();
        } else {
            if( !current_state.armed &&
                (ros::Time::now() - last_request > ros::Duration(5.0))){
                if( arming_client.call(arm_cmd) &&
                    arm_cmd.response.success){
                    ROS_INFO("Vehicle armed");
                }
                last_request = ros::Time::now();
            }
        }
        //int i = 0;
        if(true){
            local_pos_pub.publish(cmd_position);
            i++;
            std::cout<<"i"<<i<<std::endl;
            rate.sleep();
            continue;
        }
        else{
            local_pos_pub.publish(current_pose);
            rate.sleep();
        }


       /* std::cout<<"i: "<<i<<std::endl;
        //FIXME: Source of error. maybe shouldnt set them to zero.
        if(!new_position_cmd && !new_velocity_cmd){
            //give setpoint equal to the current
            local_pos_pub.publish(current_pose);
        }
        else if(new_position_cmd){
            local_pos_pub.publish(cmd_position);
        }
        else if(new_velocity_cmd){
            local_vel_pub.publish(cmd_vel);
        }
        //local_vel_pub.publish(cmd_vel);

        *//*if(i< 1000) local_pos_pub.publish(cmd_position);
        else local_vel_pub.publish(cmd_vel);*/
        /*ros::spinOnce();
        rate.sleep();
        new_velocity_cmd = false;
        new_position_cmd = false;
        new_current_pose = false;*/


    }


    return 0;
}

