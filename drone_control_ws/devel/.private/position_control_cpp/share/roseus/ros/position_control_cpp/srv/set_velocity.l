;; Auto-generated. Do not edit!


(when (boundp 'position_control_cpp::set_velocity)
  (if (not (find-package "POSITION_CONTROL_CPP"))
    (make-package "POSITION_CONTROL_CPP"))
  (shadow 'set_velocity (find-package "POSITION_CONTROL_CPP")))
(unless (find-package "POSITION_CONTROL_CPP::SET_VELOCITY")
  (make-package "POSITION_CONTROL_CPP::SET_VELOCITY"))
(unless (find-package "POSITION_CONTROL_CPP::SET_VELOCITYREQUEST")
  (make-package "POSITION_CONTROL_CPP::SET_VELOCITYREQUEST"))
(unless (find-package "POSITION_CONTROL_CPP::SET_VELOCITYRESPONSE")
  (make-package "POSITION_CONTROL_CPP::SET_VELOCITYRESPONSE"))

(in-package "ROS")





(defclass position_control_cpp::set_velocityRequest
  :super ros::object
  :slots (_x _y ))

(defmethod position_control_cpp::set_velocityRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass position_control_cpp::set_velocityResponse
  :super ros::object
  :slots ())

(defmethod position_control_cpp::set_velocityResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass position_control_cpp::set_velocity
  :super ros::object
  :slots ())

(setf (get position_control_cpp::set_velocity :md5sum-) "209f516d3eb691f0663e25cb750d67c1")
(setf (get position_control_cpp::set_velocity :datatype-) "position_control_cpp/set_velocity")
(setf (get position_control_cpp::set_velocity :request) position_control_cpp::set_velocityRequest)
(setf (get position_control_cpp::set_velocity :response) position_control_cpp::set_velocityResponse)

(defmethod position_control_cpp::set_velocityRequest
  (:response () (instance position_control_cpp::set_velocityResponse :init)))

(setf (get position_control_cpp::set_velocityRequest :md5sum-) "209f516d3eb691f0663e25cb750d67c1")
(setf (get position_control_cpp::set_velocityRequest :datatype-) "position_control_cpp/set_velocityRequest")
(setf (get position_control_cpp::set_velocityRequest :definition-)
      "float64 x
float64 y
---
")

(setf (get position_control_cpp::set_velocityResponse :md5sum-) "209f516d3eb691f0663e25cb750d67c1")
(setf (get position_control_cpp::set_velocityResponse :datatype-) "position_control_cpp/set_velocityResponse")
(setf (get position_control_cpp::set_velocityResponse :definition-)
      "float64 x
float64 y
---
")



(provide :position_control_cpp/set_velocity "209f516d3eb691f0663e25cb750d67c1")


