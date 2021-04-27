import sys
import numpy as np
import time
import random
import rospy
from std_srvs.srv import Empty
from gazebo_msgs.srv import GetModelState
import std_msgs
import geometry_msgs.msg
from gazebo_msgs.srv import ApplyBodyWrench, BodyRequest
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import SetModelState
from gym import spaces

class PlayCatch(object):

    def __init__(self):
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

        #TODO: add the different actions
        # self.move_dict = {0: [0, 0], 1: [-0.5, 0], 2: [-1, 0], 3: [0.5, 0], 4: [1, 0], 5: [0, 0.1], 6:[0, 0.2], 7:[0, 0.5], 8:[0, 1], 9:[-1.5, 0], 10:[-2, 0], 11:[-3, 0], 12:[-5, 0], 13:[1.5, 0], 14:[2, 0], 15:[3, 0], 16:[5, 0]}
        self.move_dict = {0: [0, 0],
                          1: [-0.25, 0], 2: [-0.5, 0],
                          3: [-1, 0], 4: [-2, 0], 5: [-3, 0], 6: [-4, 0], 7:[-5, 0],
                          8:[-6, 0], 9:[-7,0], 10:[-8, 0], 11:[-9, 0], 12:[-10, 0],
                          13:[0.25, 0], 14:[0.5, 0],
                          15:[1, 0], 16:[2, 0], 17:[3, 0], 18:[4, 0], 19:[5,0],
                          20:[6,0], 21:[7,0], 22:[8,0], 23:[9,0], 24:[10,0]
                          }
        self.observation_space = spaces.Box(low=np.array([-500.0, -500.0, -500.0, -500.0, -500.0]),
                                            high=np.array([500.0, 500.0, 500.0, 500.0, 500.0]), dtype=np.float32)


        #TODO: changing obsevation dimensions to ball position(x, y, z) and robot position (x, y)
        self.observation_dimensions = 5
        #TODO: action space would need to change depending on the number of actions
        #self.action_space = 25
        self.action_space = spaces.Discrete(25)

        #init node
        rospy.init_node('turtlebot3_catahcer_node', anonymous=True)

        # put all the parameter values here
        self.ball_initial_position_x = 0
        self.ball_initial_position_y = 0
        self.initial_time = rospy.get_time()
        self.first_velocity_command = True
        self.number_of_times_caught= 0;


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
        fx = random.uniform(6, 10)
        #fy = random.randint(10, 20)
        fy = 0
        fz = random.randint(30, 50) # values of initial test were 10, 0, 100
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
        #TODO: add code to pause gazebo s')
        print('Number of times caught: ' + str(self.number_of_times_caught))
        print('Destroying/Stopping simulation but maybe a function needs to be implemented to do that')

    def reset(self):

        # maybe do some 'wait for service' here
        reset_simulation = rospy.ServiceProxy('/gazebo/reset_world', Empty)

        # invoke
        reset_simulation()

        #after resetting the simulation wait for 1 second and launch the ball
        self.launch_ball()

        #TODO: return statement needed for the reset function
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        robot_pose = poses('turtlebot3_burger_catcher', '')
        ball_pose = poses('unit_sphere', '')
        observations = np.array((robot_pose.pose.position.x,
                                 ball_pose.pose.position.x, ball_pose.pose.position.z,
                                 ball_pose.twist.linear.x, ball_pose.twist.linear.z))

        return observations

        #return np.asarray(self.ball_position + [self.quad_position[2]] + self.quad_orientation)

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
        vrep.simxSetObjectPosition(self.clientId, self.quad_taret, -1, quad_target_xyz, vrep.simx_opmode_oneshot)
        '''

    def set_model_state_turtlebot(self, vel_x, vel_y):
        model_state = ModelState()
        model_state.model_name = 'turtlebot3_burger_catcher'
        model_state.reference_frame = 'world'
        if(self.first_velocity_command):
            self.initial_time = rospy.get_time()
            self.first_velocity_command = False
            return model_state
        delta_t = rospy.get_time() - self.initial_time
        #print('delta_t : ' + str(delta_t))
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        robot_pose = poses('turtlebot3_burger_catcher', '')
        model_state.pose.position.x = robot_pose.pose.position.x + vel_x*delta_t
        model_state.twist.linear.x = vel_x
        self.initial_time = rospy.get_time()
        return model_state


    def pub_cmd_vel(self, vel_x, vel_y):

        # pub = rospy.Publisher('/cmd_vel', geometry_msgs.msg.Twist, queue_size=10)
        # rospy.init_node('publish action', anonymous=True)
        # cmd_vel = geometry_msgs.msg.Twist()
        # cmd_vel.linear.x = vel_x
        # cmd_vel.angular.z = ang_z

        pub = rospy.Publisher('/gazebo/set_model_state', ModelState)

        #rospy.init_node('publish action', anonymous=True)

        cmd_vel_state = ModelState()
        cmd_vel_state = self.set_model_state_turtlebot(vel_x, vel_y)
        # cmd_vel_state.model_name = 'turtlebot3_burger_catcher'
        # cmd_vel_state.reference_frame = 'turtlebot3_burger_catcher'
        # cmd_vel_state.twist.linear.x = vel_x
        # cmd_vel_state.twist.linear.y = vel_y
        pub.publish(cmd_vel_state)

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

        obs, reward, d = self.exec_step(action)
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

        #TODO: send the action to the robot
        action_value  = self.move_dict[action]
        self.pub_cmd_vel(action_value[0], action_value[1])

        #get observations = ball position and robot position
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        robot_pose = poses('turtlebot3_burger_catcher', '')
        ball_pose = poses('unit_sphere', '')
        observations = np.array((robot_pose.pose.position.x,
                                 ball_pose.pose.position.x, ball_pose.pose.position.z,
                                 ball_pose.twist.linear.x, ball_pose.twist.linear.z))

        done, reward = self.get_reward()
        return observations, reward, done

    def was_ball_caught(self):
        # get positions of ball and robot
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        robot_pose = poses('turtlebot3_burger_catcher', '')
        ball_pose = poses('unit_sphere', '')

        robot_pose_2d = np.array((robot_pose.pose.position.x, robot_pose.pose.position.y))

        ball_pose_2d = np.array((ball_pose.pose.position.x, ball_pose.pose.position.y))
        z_ball = ball_pose.pose.position.z
        # if 2d distance between them is less than 10 cm AND z distance is greater than 20 but less tan 25
        planar_distance = np.linalg.norm(robot_pose_2d - ball_pose_2d)
        if planar_distance < 0.15 and 0.25 > z_ball > 0.1:
            self.number_of_times_caught+=1
            return True

        return False

    def was_ball_dropped(self):
        #TODO: change the initial position when you change the actual initial position

        ball_initial_position_2d = np.array((self.ball_initial_position_x, self.ball_initial_position_y))
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)

        ball_pose = poses('unit_sphere', '')
        ball_current_position_2d = np.array((ball_pose.pose.position.x, ball_pose.pose.position.y))
        planar_distance = np.linalg.norm(ball_current_position_2d - ball_initial_position_2d)
        z_ball = ball_pose.pose.position.z
        if z_ball < 0.1 and planar_distance > 0.1:
            return True
        return False


    def get_reward_planar_dist(self):
        reward = 0
        poses = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        robot_pose = poses('turtlebot3_burger_catcher', '')
        ball_pose = poses('unit_sphere', '')

        #robot_pose_2d = np.array((robot_pose.pose.position.x, robot_pose.pose.position.y))
        robot_pose_x = robot_pose.pose.position.x
        ball_pose_x = ball_pose.pose.position.x


        planar_distance = abs(robot_pose_x - ball_pose_x)
        #reward = 1/(1 + 10*planar_distance)
        reward = -10*planar_distance

        return reward

    def get_reward(self):
        done = False
        reward = 0

        # if ball is caught give positive reward
        if self.was_ball_caught():
            reward = 100
            done = True

        if self.was_ball_dropped():
            reward = -100
            done = True

        #Reward based on planar distance
        #FIXME(maybe) : source of error. if training not successful remove this
        reward += self.get_reward_planar_dist()

        return done, reward

