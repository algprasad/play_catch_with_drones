; Auto-generated. Do not edit!


(cl:in-package position_control_cpp-srv)


;//! \htmlinclude set_velocity-request.msg.html

(cl:defclass <set_velocity-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass set_velocity-request (<set_velocity-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_velocity-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_velocity-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name position_control_cpp-srv:<set_velocity-request> is deprecated: use position_control_cpp-srv:set_velocity-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <set_velocity-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader position_control_cpp-srv:x-val is deprecated.  Use position_control_cpp-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <set_velocity-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader position_control_cpp-srv:y-val is deprecated.  Use position_control_cpp-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_velocity-request>) ostream)
  "Serializes a message object of type '<set_velocity-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_velocity-request>) istream)
  "Deserializes a message object of type '<set_velocity-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_velocity-request>)))
  "Returns string type for a service object of type '<set_velocity-request>"
  "position_control_cpp/set_velocityRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_velocity-request)))
  "Returns string type for a service object of type 'set_velocity-request"
  "position_control_cpp/set_velocityRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_velocity-request>)))
  "Returns md5sum for a message object of type '<set_velocity-request>"
  "209f516d3eb691f0663e25cb750d67c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_velocity-request)))
  "Returns md5sum for a message object of type 'set_velocity-request"
  "209f516d3eb691f0663e25cb750d67c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_velocity-request>)))
  "Returns full string definition for message of type '<set_velocity-request>"
  (cl:format cl:nil "float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_velocity-request)))
  "Returns full string definition for message of type 'set_velocity-request"
  (cl:format cl:nil "float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_velocity-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_velocity-request>))
  "Converts a ROS message object to a list"
  (cl:list 'set_velocity-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
;//! \htmlinclude set_velocity-response.msg.html

(cl:defclass <set_velocity-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass set_velocity-response (<set_velocity-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_velocity-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_velocity-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name position_control_cpp-srv:<set_velocity-response> is deprecated: use position_control_cpp-srv:set_velocity-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_velocity-response>) ostream)
  "Serializes a message object of type '<set_velocity-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_velocity-response>) istream)
  "Deserializes a message object of type '<set_velocity-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_velocity-response>)))
  "Returns string type for a service object of type '<set_velocity-response>"
  "position_control_cpp/set_velocityResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_velocity-response)))
  "Returns string type for a service object of type 'set_velocity-response"
  "position_control_cpp/set_velocityResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_velocity-response>)))
  "Returns md5sum for a message object of type '<set_velocity-response>"
  "209f516d3eb691f0663e25cb750d67c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_velocity-response)))
  "Returns md5sum for a message object of type 'set_velocity-response"
  "209f516d3eb691f0663e25cb750d67c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_velocity-response>)))
  "Returns full string definition for message of type '<set_velocity-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_velocity-response)))
  "Returns full string definition for message of type 'set_velocity-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_velocity-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_velocity-response>))
  "Converts a ROS message object to a list"
  (cl:list 'set_velocity-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'set_velocity)))
  'set_velocity-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'set_velocity)))
  'set_velocity-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_velocity)))
  "Returns string type for a service object of type '<set_velocity>"
  "position_control_cpp/set_velocity")