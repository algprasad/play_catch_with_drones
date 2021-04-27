import sys
import geometry_msgs
import rospy
import time
from gazebo_msgs.srv import ApplyBodyWrench, BodyRequest


def apply_body_wrench_client(body_name, reference_frame, reference_point, wrench, \
    start_time, duration):
    rospy.wait_for_service('/gazebo/apply_body_wrench')
    try:
        apply_body_wrench = rospy.ServiceProxy('/gazebo/apply_body_wrench', ApplyBodyWrench)
        apply_body_wrench(body_name, reference_frame, reference_point, wrench, start_time, duration)
    except rospy.ServiceException as e:
        print ("Service call failed: %s"%e)

def clear_body_wrench_client(body_name):
    rospy.wait_for_service('gazebo/clear_body_wrenches')
    try:
        clear_body_wrench = rospy.ServiceProxy('gazebo/clear_body_wrenches', BodyRequest)
        clear_body_wrench(body_name)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)


def launch_ball():
    update_rate = 0.001
    body_name = 'unit_sphere::link'
    reference_frame = 'unit_sphere::link'
    start_time = rospy.Time(secs=0, nsecs=0)
    duration = rospy.Duration(secs=update_rate, nsecs=0)
    reference_point = geometry_msgs.msg.Point(x=0, y=0, z=0)
    t = []
    f = []
    wrench = geometry_msgs.msg.Wrench(force=geometry_msgs.msg.Vector3(x=10, y=0, z=100), \
                                      torque=geometry_msgs.msg.Vector3(x=0, y=0, z=0))

    clear_body_wrench_client(body_name)
    apply_body_wrench_client(body_name, reference_frame, reference_point, wrench, start_time, duration)

if __name__ == "__main__":
    launch_ball()
    print('Ball should have launched')
    # beginning = time.time()
    # update_rate = 0.001
    # period = 1
    # body_name = 'unit_sphere::link'
    # reference_frame = 'unit_sphere::link'
    # start_time = rospy.Time(secs = 0, nsecs = 0)
    # duration = rospy.Duration(secs = update_rate, nsecs = 0)
    # reference_point = geometry_msgs.msg.Point(x = 0, y = 0, z = 0)
    # t = []
    # f = []
    # wrench = geometry_msgs.msg.Wrench(force = geometry_msgs.msg.Vector3( x = 10, y = 0, z = 10), \
    #                                     torque = geometry_msgs.msg.Vector3(x = 0, y = 0, z = 0))
    # t.append(time.time() - beginning)
    # f.append(wrench.force.y)
    # clear_body_wrench_client(body_name)
    # apply_body_wrench_client(body_name, reference_frame, reference_point, wrench, start_time, duration)
