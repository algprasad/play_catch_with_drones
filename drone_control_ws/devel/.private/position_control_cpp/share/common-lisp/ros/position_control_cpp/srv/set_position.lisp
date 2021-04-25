; Auto-generated. Do not edit!


(cl:in-package position_control_cpp-srv)


;//! \htmlinclude set_position-request.msg.html

(cl:defclass <set_position-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass set_position-request (<set_position-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_position-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_position-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name position_control_cpp-srv:<set_position-request> is deprecated: use position_control_cpp-srv:set_position-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <set_position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader position_control_cpp-srv:x-val is deprecated.  Use position_control_cpp-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <set_position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader position_control_cpp-srv:y-val is deprecated.  Use position_control_cpp-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_position-request>) ostream)
  "Serializes a message object of type '<set_position-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_position-request>) istream)
  "Deserializes a message object of type '<set_position-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_position-request>)))
  "Returns string type for a service object of type '<set_position-request>"
  "position_control_cpp/set_positionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_position-request)))
  "Returns string type for a service object of type 'set_position-request"
  "position_control_cpp/set_positionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_position-request>)))
  "Returns md5sum for a message object of type '<set_position-request>"
  "209f516d3eb691f0663e25cb750d67c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_position-request)))
  "Returns md5sum for a message object of type 'set_position-request"
  "209f516d3eb691f0663e25cb750d67c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_position-request>)))
  "Returns full string definition for message of type '<set_position-request>"
  (cl:format cl:nil "float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_position-request)))
  "Returns full string definition for message of type 'set_position-request"
  (cl:format cl:nil "float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_position-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_position-request>))
  "Converts a ROS message object to a list"
  (cl:list 'set_position-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
;//! \htmlinclude set_position-response.msg.html

(cl:defclass <set_position-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass set_position-response (<set_position-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_position-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_position-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name position_control_cpp-srv:<set_position-response> is deprecated: use position_control_cpp-srv:set_position-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_position-response>) ostream)
  "Serializes a message object of type '<set_position-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_position-response>) istream)
  "Deserializes a message object of type '<set_position-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_position-response>)))
  "Returns string type for a service object of type '<set_position-response>"
  "position_control_cpp/set_positionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_position-response)))
  "Returns string type for a service object of type 'set_position-response"
  "position_control_cpp/set_positionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_position-response>)))
  "Returns md5sum for a message object of type '<set_position-response>"
  "209f516d3eb691f0663e25cb750d67c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_position-response)))
  "Returns md5sum for a message object of type 'set_position-response"
  "209f516d3eb691f0663e25cb750d67c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_position-response>)))
  "Returns full string definition for message of type '<set_position-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_position-response)))
  "Returns full string definition for message of type 'set_position-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_position-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_position-response>))
  "Converts a ROS message object to a list"
  (cl:list 'set_position-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'set_position)))
  'set_position-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'set_position)))
  'set_position-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_position)))
  "Returns string type for a service object of type '<set_position>"
  "position_control_cpp/set_position")