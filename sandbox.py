import geometry_msgs.msg
import numpy as np
import rospy
from std_srvs.srv import Empty
from gazebo_msgs.srv import GetModelState
from gazebo_msgs.srv import SetModelState
from mavros_msgs.srv import SetMavFrame
from gazebo_msgs.msg import ModelState
import pdb

def reset_gazebo_simulation():
    # maybe do some 'wait for service' here
    reset_simulation = rospy.ServiceProxy('/gazebo/reset_world', Empty)

    # invoke
    reset_simulation()

def set_cmd_vel(cmd_vel):
    cmd_vel_pub = rospy.Publisher('position_control_cpp/cmd_vel', geometry_msgs.msg.Twist, queue_size=10)
    rospy.init_node('cmd_vel_node_py', anonymous=True)
    i = 0
    cmd_vel_set = rospy.ServiceProxy('/mavros/setpoint_velocity/mav_frame', SetMavFrame)
    mav_frame_vel = geometry_msgs.msg.Twist()
    success = False
    while(not success):
        success = cmd_vel_set.call(mav_frame_vel)

    # while(i < 10000):
    #     cmd_vel_pub.publish(cmd_vel)
    #     print(i)
    #     i+=1

def pub_iris_cmd_vel(cmd_vel):
    cmd_vel_pub = rospy.Publisher('/mavros/setpoint_velocity/cmd_vel', geometry_msgs.msg.TwistStamped, queue_size=10)
    rospy.init_node('cmd_vel_node_py', anonymous=True)
    rate = rospy.Rate(20)
    i= 0
    while(i< 5):
        cmd_vel.twist.linear.x+=2
        cmd_vel_pub.publish(cmd_vel)
        rate.sleep()
        print(i)
        i+=1


def was_ball_caught():
    # get positions of ball and robot
    poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
    robot_pose = poses('turtlebot3_burger_catcher', '')
    ball_pose = poses('unit_sphere', '')

    robot_pose_2d = np.array((robot_pose.pose.position.x, robot_pose.pose.position.y))

    ball_pose_2d = np.array((ball_pose.pose.position.x, ball_pose.pose.position.y))
    z_ball = ball_pose.pose.position.z
    # if 2d distance between them is less than 10 cm AND z distance is greater than 20 but less tan 25
    planar_distance = np.linalg.norm(robot_pose_2d - ball_pose_2d)
    if planar_distance < 0.10 and 0.25 > z_ball > 0.20:
        return True

    return False


def was_ball_dropped():
    # TODO: change the initial position when you change the actual initial position

    ball_initial_position_2d = np.array((0, 0))
    poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)

    ball_pose = poses('unit_sphere', '')
    ball_current_position_2d = np.array((ball_pose.pose.position.x, ball_pose.pose.position.y))
    planar_distance = np.linalg.norm(ball_current_position_2d - ball_initial_position_2d)
    z_ball = ball_pose.pose.position.z
    if z_ball < 0.1 and planar_distance > 0.1:
        return True
    return False


def pub_cmd_vel():

    pub = rospy.Publisher('/cmd_vel', geometry_msgs.msg.Twist, queue_size=10 )
    rospy.init_node('publish action', anonymous=True)
    cmd_vel = geometry_msgs.msg.Twist()
    cmd_vel.linear.x = 0.4
    cmd_vel.angular.z = 0.1
    pub.publish(cmd_vel)

#resetting ball position
def reset_ball_position():
    set_position_pub = rospy.Publisher('/gazebo/set_model_state', ModelState)
    rospy.init_node('reset ball', anonymous=True)
    initial_pose = ModelState()
    initial_pose.model_name = 'unit_sphere'
    initial_pose.pose.position.x = -5
    initial_pose.pose.position.y = 0
    initial_pose.pose.position.z = 0
    j = 0
    rate = rospy.Rate(20)
    while(j < 10):
        set_position_pub.publish(initial_pose)
        j+=1
        rate.sleep()





#reset_gazebo_simulation()

# get values of the position of the ball and the robot


model_coordinates = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
pose = model_coordinates('unit_sphere', '' );
print(pose.pose.position.z)
i= 0
#reset_ball_position()
while True:
    initial_position_x = 0
    initial_position_y = 0
    initial_position_z = 0

    print(i)
    if was_ball_caught():
        print('BALL CAUGHT!')
        break
    elif was_ball_dropped():
        print('BALL DROPEED!')
        break
    # cmd_vel = geometry_msgs.msg.TwistStamped()
    # cmd_vel.twist.linear.x = 0
    # cmd_vel.twist.linear.z = 0.5
    # if(was_ball_caught()):
    #     print('Ball caught!')
    #     break
    # if(was_ball_dropped()):
    #     print('Ball Dropped')
    #     break
    #
    # #set_cmd_vel(cmd_vel)
    # #pub_iris_cmd_vel(cmd_vel)
    # print(i)
    # i+=1








