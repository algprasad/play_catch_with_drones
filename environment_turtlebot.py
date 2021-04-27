import sys
import numpy as np
import time
import random
import rospy
import tensorflow as tf
from std_srvs.srv import Empty
from gazebo_msgs.srv import GetModelState
import std_msgs
import geometry_msgs.msg
import geometry_msgs as gm
from gazebo_msgs.srv import ApplyBodyWrench, BodyRequest
from gazebo_msgs.msg import ModelState
from gym import spaces


class PlayCatch(object):

    def __init__(self):
        print('Inside Play catch')
        '''
        Connecting to V-REP
        vrep.simxFinish(-1)
        self.clientId = vrep.simxStart('127.0.0.1', 19997, True, True, 5000, 5)
        if self.clientId != -1:
            print('Connected to remote API server')
        else:
            print('Connection to V-Rep server failed')
            sys.exit('Could Not Connect')

        vrep.simxSynchronous(self.clientId, True)
        self.bounceCount = 0
        vrep.simxStopSimulation(self.clientId, vrep.simx_opmode_oneshot)
        '''

        self.reset()

        # TODO: add the different actions
        # self.move_dict = {0: [0, 0], 1: [-0.5, 0], 2: [-1, 0], 3: [0.5, 0], 4: [1, 0], 5: [0, 0.1], 6:[0, 0.2], 7:[0, 0.5], 8:[0, 1], 9:[-1.5, 0], 10:[-2, 0], 11:[-3, 0], 12:[-5, 0], 13:[1.5, 0], 14:[2, 0], 15:[3, 0], 16:[5, 0]}
        # self.move_dict = {0: [0, 0], 1: [-0.25, 0], 2: [-0.5, 0], 3: [0.25, 0], 4: [0.5, 0], 5: [0, 0.1], 6: [0, 0.2],
        #                   7: [0, 0.5]}
        # self.move_dict = {0: [0, 0],
        #                   1: [-0.25, 0], 2: [-0.5, 0], 3: [-1, 0], 4: [-5, 0],
        #                   5: [0.25, 0], 6: [0.5, 0], 7: [1, 0], 8:[5, 0],
        #                   9:[0, -0.25], 10:[0, -0.5], 11:[0, -1], 12:[0, -5],
        #                   13:[0, 0.25], 14:[0, 0.5], 15:[0, 1], 16:[0, 5],
        #                   17:[-10, 0 ], 18:[10, 0], 19:[0, -10], 20:[0, 10]}
        #self.move_dict = {0: [0, 0], 1: [1, 0], 2: [5, 0], 3: [-1, 0], 4: [-0.5, 0], 5: [10, 0], 6: [15, 0], 7: [-5, 0], 8: [-2, 0]}
        #                   7: [-0.5, 0], 8: [-1, 0], 9: [-2, 0], 10: [-5, 0], 11: [-10, 0], 12: [-15, 0]}
        self.move_dict = {0: [0, 0],
                          1: [-0.25, 0], 2: [-0.5, 0],
                          3: [-1, 0], 4: [-2, 0], 5: [-3, 0], 6: [-4, 0], 7: [-5, 0],
                          8: [-6, 0], 9: [-7, 0], 10: [-8, 0], 11: [-9, 0], 12: [-10, 0],
                          13: [0.25, 0], 14: [0.5, 0],
                          15: [1, 0], 16: [2, 0], 17: [3, 0], 18: [4, 0], 19: [5, 0],
                          20: [6, 0], 21: [7, 0], 22: [8, 0], 23: [9, 0], 24: [10, 0]
                          }




        # TODO: changing obsevation dimensions to ball position(x, y, z) and robot position (x, y)
        self.observation_dimensions = 5
        self.observation_space = spaces.Box(low=np.array([-500.0, -500.0, -500.0, -500.0, -500.0]),
                                            high=np.array([500.0, 500.0, 500.0, 500.0, 500.0]), dtype=np.float32)
        # self.observation_space = tf.placeholder(shape=(None, self.observation_dimensions), dtype=tf.float32)

        # TODO: action space would need to change depending on the number of actions

        # self.action_space = 25
        self.action_space = spaces.Discrete(25)
        # put all the parameter values here
        self.ball_initial_position_x = 0
        self.ball_initial_position_y = 0
        self.no_of_catches = 0
        # self.node = rospy.init_node('ball_catcher_drone', anonymous=True)
        # self.set_position_pub = rospy.Publisher('/gazebo/set_model_state', ModelState)
        # self.cmd_vel_pub = rospy.Publisher('/mavros/setpoint_velocity/cmd_vel', geometry_msgs.msg.TwistStamped,
        #                                    queue_size=10)
        # self.rate = rospy.Rate(20)

        # self.incremental_step_count = 0
        # self.incremental_step = []
        # self.prev_ball_pos = []
        # self.bounceFlag = False
        # self.prevBounceFlag = False

    def apply_body_wrench_client(self, body_name, reference_frame, reference_point, wrench, \
                                 start_time, duration):
        rospy.wait_for_service('/gazebo/apply_body_wrench')
        try:
            apply_body_wrench = rospy.ServiceProxy('/gazebo/apply_body_wrench', ApplyBodyWrench)
            apply_body_wrench(body_name, reference_frame, reference_point, wrench, start_time, duration)
        except rospy.ServiceException as e:
            print("Service call failed: %s" % e)

    def clear_body_wrench_client(self, body_name):
        rospy.wait_for_service('gazebo/clear_body_wrenches')
        try:
            clear_body_wrench = rospy.ServiceProxy('gazebo/clear_body_wrenches', BodyRequest)
            clear_body_wrench(body_name)
        except rospy.ServiceException as e:
            print("Service call failed: %s" % e)

    def launch_ball(self):

        update_rate = 0.001
        body_name = 'unit_sphere::link'
        reference_frame = 'unit_sphere::link'
        start_time = rospy.Time(secs=0, nsecs=0)
        duration = rospy.Duration(secs=update_rate, nsecs=0)
        reference_point = geometry_msgs.msg.Point(x=0, y=0, z=0)
        t = []
        f = []
        fx = random.uniform(20, 80)
        # fy = random.randint(10, 20)
        fy = 0
        fz = random.randint(100, 150)  # values of initial test were 10, 0, 100
        wrench = geometry_msgs.msg.Wrench(force=geometry_msgs.msg.Vector3(x=fx, y=fy, z=fz), \
                                          torque=geometry_msgs.msg.Vector3(x=0, y=0, z=0))

        self.clear_body_wrench_client(body_name)
        self.apply_body_wrench_client(body_name, reference_frame, reference_point, wrench, start_time, duration)

    def get_handles(self):
        '''
        _, self.quad = vrep.simxGetObjectHandle(self.clientId, "Quadricopter", vrep.simx_opmode_blocking)
        _, self.quad_target = vrep.simxGetObjectHandle(self.clientId, "Quadricopter_target", vrep.simx_opmode_blocking)
        _, self.ball = vrep.simxGetObjectHandle(self.clientId, "ball", vrep.simx_opmode_blocking)
        _, self.quad_position = vrep.simxGetObjectPosition(self.clientId, self.quad, -1, vrep.simx_opmode_streaming)
        _, self.quad_orientation = vrep.simxGetObjectOrientation(self.clientId, self.quad, -1,
                                                                 vrep.simx_opmode_streaming)
        _, self.quad_target_position = vrep.simxGetObjectPosition(self.clientId, self.quad_target, -1,
                                                                  vrep.simx_opmode_streaming)
        _, self.ball_position = vrep.simxGetObjectPosition(self.clientId, self.ball, self.quad,
                                                           vrep.simx_opmode_streaming)
        # _, self.collision_stream = vrep.simxReadCollision(self.clientId,self.quad_collision_handle,vrep.simx_opmode_streaming)
        '''

    def destroy(self):
        # TODO: add code to pause gazebo simuation
        print('Destroying/Stopping simulation but maybe a function needs to be implemented to do that')

    # #function to reset iris position. not used for control
    # def pub_iris_position(self):
    #     pub = rospy.Publisher('/position_control_cpp/cmd_pos', geometry_msgs.msg.Twist, queue_size=10)
    #     rospy.init_node('publish action pose', anonymous=True)
    #     cmd_pose = gm.msg.Pose()
    #     cmd_pose.position.x = 0
    #     cmd_pose.position.y = 0
    #     cmd_pose.position.z = 2
    #     pub.publish(cmd_pose)
    #
    def myhook(self):
        print('shutting down node')

    def reset_iris_position(self):
        # make it close to initial position
        rospy.init_node('cmd_vel_node_py2', anonymous=True)
        print('Resetting Iris position')
        euclidan_distance = 1.5
        while (euclidan_distance > 0.5):
            poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
            robot_pose = poses('iris_with_bowl', '')
            robot_pose_current = np.array(
                (robot_pose.pose.position.x, robot_pose.pose.position.y, robot_pose.pose.position.z))
            robot_pose_initial = np.array((0, 0, 2))
            euclidan_distance = np.linalg.norm(robot_pose_current - robot_pose_initial)
            # print(euclidan_distance)
        # rospy.on_shutdown(self.myhook)

    def reset_ball_position(self):
        set_position_pub = rospy.Publisher('/gazebo/set_model_state', ModelState, queue_size=5)
        # rospy.init_node('reset ball', anonymous=True)
        initial_pose = ModelState()
        initial_pose.model_name = 'unit_sphere'
        initial_pose.pose.position.x = -7
        initial_pose.pose.position.y = 0
        initial_pose.pose.position.z = 0
        j = 0
        rate = rospy.Rate(20)
        while (j < 10):
            set_position_pub.publish(initial_pose)
            j += 1
            rate.sleep()
        # rospy.on_shutdown(self.myhook)

    def set_to_initial_position(self):
        # TODO: publish the rostopic messgae to send the drone to the initial position
        self.reset_iris_position()

        # TODO: use set_model_states to send the ball to the initial position
        self.reset_ball_position()

    def reset(self):
        print('Resetting world ...................')

        # maybe do some 'wait for service' here
        # reset_simulation = rospy.ServiceProxy('/gazebo/reset_world', Empty)

        # invoke
        # reset_simulation()
        self.set_to_initial_position()

        # after resetting the simulation wait for 1 second and launch the ball

        self.launch_ball()
        # TODO: return statement needed for the reset function
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        robot_pose = poses('iris_with_bowl', '')
        ball_pose = poses('unit_sphere', '')
        print('Getting observations ....................')
        observations = np.array((robot_pose.pose.position.x,
                                 ball_pose.pose.position.x, ball_pose.pose.position.z,
                                 ball_pose.twist.linear.x, ball_pose.twist.linear.z))

        print('World Reset ...........')
        return observations

        # return np.asarray(self.ball_position + [self.quad_position[2]] + self.quad_orientation)

    # TODO: (OFN) code to do random initialization. To be skipped for now
    def random_init(self):
        '''
        x_range = [1.0, -1.0]
        y_range = [1.0, -1.0]
        z_range = [1.5, 0.4]
        quad_xyz = self.quad_position
        quad_target_xyz = self.quad_target_position
        ball_xyz = self.ball_position

        vrep.simxSetObjectPosition(self.clientId, self.quad, -1, quad_xyz, vrep.simx_opmode_oneshot)
        vrep.simxSetObjectPosition(self.clientId, self.ball, -1, ball_xyz, vrep.simx_opmode_oneshot)
        vrep.simxSetObjectPosition(self.clientId, self.quad_target, -1, quad_target_xyz, vrep.simx_opmode_oneshot)
        '''

    def pub_cmd_vel(self, vel_x, vel_y):
        cmd_vel_pub = rospy.Publisher('/mavros/setpoint_velocity/cmd_vel', geometry_msgs.msg.TwistStamped,
                                      queue_size=10)
        # rospy.init_node('cmd_vel_node_py2', anonymous=True)
        rate = rospy.Rate(20)
        i = 0
        cmd_vel = geometry_msgs.msg.TwistStamped()
        while (i < 5):
            cmd_vel.twist.linear.x = vel_x
            cmd_vel.twist.linear.y = vel_y
            cmd_vel_pub.publish(cmd_vel)
            rate.sleep()
            # print(i)
            i += 1
        # rospy.on_shutdown()

    def step(self, action):
        # The Simulator returns the same state multiple times. Hence, wait until there is state change and then call exec_step
        '''
        while True:
            _, curr_ball_position = vrep.simxGetObjectPosition(self.clientId, self.ball, self.quad,
                                                               vrep.simx_opmode_streaming)
            if self.prev_ball_pos == curr_ball_position:
                continue
            break
        '''
        d, obs, reward = self.exec_step(action)
        return obs, reward, d

    def exec_step(self, action):
        '''
        new_target = list(self.previous_target_pos + np.asarray(self.move_dict[action]))

        vrep.simxSetObjectPosition(self.clientId, self.quad_target, -1, new_target, vrep.simx_opmode_oneshot)

        _, self.quad_position = vrep.simxGetObjectPosition(self.clientId, self.quad, -1, vrep.simx_opmode_buffer)
        _, self.quad_orientation = vrep.simxGetObjectOrientation(self.clientId, self.quad, -1, vrep.simx_opmode_buffer)
        _, self.quad_target_position = vrep.simxGetObjectPosition(self.clientId, self.quad_target, -1,
                                                                  vrep.simx_opmode_buffer)
        _, self.ball_position = vrep.simxGetObjectPosition(self.clientId, self.ball, self.quad, vrep.simx_opmode_buffer)
        '''

        # TODO: send the action to the robot
        action_value = self.move_dict[action]
        self.pub_cmd_vel(action_value[0], action_value[1])

        # get observations = ball position and robot position
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        robot_pose = poses('iris_with_bowl', '')
        ball_pose = poses('unit_sphere', '')
        observations = np.array((robot_pose.pose.position.x,
                                 ball_pose.pose.position.x, ball_pose.pose.position.z,
                                 ball_pose.twist.linear.x, ball_pose.twist.linear.z))
        done, reward = self.get_reward()
        return done, observations, reward

    def was_ball_caught(self):
        # get positions of ball and robot
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        robot_pose = poses('iris_with_bowl', '')
        ball_pose = poses('unit_sphere', '')

        robot_pose_2d = np.array((robot_pose.pose.position.x, robot_pose.pose.position.y))

        ball_pose_2d = np.array((ball_pose.pose.position.x, ball_pose.pose.position.y))
        z_ball = ball_pose.pose.position.z
        z_diff = z_ball - robot_pose.pose.position.z
        # if 2d distance between them is less than 10 cm AND z distance is greater than 20 but less tan 25
        planar_distance = np.linalg.norm(robot_pose_2d - ball_pose_2d)
        # FIXME: If the iris is going towards theball but not really catching it, then decrease the planar distance threshold
        if planar_distance < 0.20 and 0.25 > z_diff > 0:
            self.no_of_catches += 1
            return True

        return False

    def was_ball_dropped(self):
        # TODO: change the initial position when you change the actual initial position

        ball_initial_position_2d = np.array((self.ball_initial_position_x, self.ball_initial_position_y))
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)

        ball_pose = poses('unit_sphere', '')
        ball_current_position_2d = np.array((ball_pose.pose.position.x, ball_pose.pose.position.y))
        # this planar distance is wrt the initial position
        planar_distance = np.linalg.norm(ball_current_position_2d - ball_initial_position_2d)
        z_ball = ball_pose.pose.position.z
        if z_ball < 0.1 and planar_distance > 0.1:
            return True
        return False

    def get_reward_planar_dist(self):
        reward = 0
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        robot_pose = poses('iris_with_bowl', '')
        ball_pose = poses('unit_sphere', '')

        robot_pose_2d = np.array((robot_pose.pose.position.x, robot_pose.pose.position.y))

        ball_pose_2d = np.array((ball_pose.pose.position.x, ball_pose.pose.position.y))
        z_ball = ball_pose.pose.position.z
        # if 2d distance between them is less than 10 cm AND z distance is greater than 20 but less tan 25
        planar_distance = np.linalg.norm(robot_pose_2d - ball_pose_2d)
        # print("d",planar_distance)
        if ball_pose.twist.linear.z < 0:
            reward = - planar_distance
            rewardp = 500/(1+planar_distance)
            if rewardp > 100:
                reward += 100
            else:
                reward +=rewardp
        return reward

    def get_reward(self):
        done = False
        reward = 0

        # if ball is caught give positive reward
        if self.was_ball_caught():
            reward = 1000
            done = True

        if self.was_ball_dropped():
            reward = -500
            done = True

        # Reward based on planar distance
        # FIXME(maybe) : source of error. if training not successful remove this
        reward += self.get_reward_planar_dist()

        return done, reward
