
(cl:in-package :asdf)

(defsystem "position_control_cpp-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "set_position" :depends-on ("_package_set_position"))
    (:file "_package_set_position" :depends-on ("_package"))
    (:file "set_velocity" :depends-on ("_package_set_velocity"))
    (:file "_package_set_velocity" :depends-on ("_package"))
  ))