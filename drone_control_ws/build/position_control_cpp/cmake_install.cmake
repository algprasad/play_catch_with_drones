# Install script for directory: /home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/src/position_control_cpp

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install" TYPE PROGRAM FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install" TYPE PROGRAM FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install/setup.bash;/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install" TYPE FILE FILES
    "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/setup.bash"
    "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install/setup.sh;/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install" TYPE FILE FILES
    "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/setup.sh"
    "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install/setup.zsh;/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install" TYPE FILE FILES
    "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/setup.zsh"
    "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/install" TYPE FILE FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/.rosinstall")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/position_control_cpp/srv" TYPE FILE FILES
    "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/src/position_control_cpp/srv/set_position.srv"
    "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/src/position_control_cpp/srv/set_velocity.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/position_control_cpp/cmake" TYPE FILE FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/position_control_cpp-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/devel/.private/position_control_cpp/include/position_control_cpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/devel/.private/position_control_cpp/share/roseus/ros/position_control_cpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/devel/.private/position_control_cpp/share/common-lisp/ros/position_control_cpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/devel/.private/position_control_cpp/share/gennodejs/ros/position_control_cpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/devel/.private/position_control_cpp/lib/python2.7/dist-packages/position_control_cpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/devel/.private/position_control_cpp/lib/python2.7/dist-packages/position_control_cpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/position_control_cpp.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/position_control_cpp/cmake" TYPE FILE FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/position_control_cpp-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/position_control_cpp/cmake" TYPE FILE FILES
    "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/position_control_cppConfig.cmake"
    "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/catkin_generated/installspace/position_control_cppConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/position_control_cpp" TYPE FILE FILES "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/src/position_control_cpp/package.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/gtest/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/alg/Desktop/ASU_Courses/Spring2021/RobotLearning/Project/drone_catcher/drone_control_ws/build/position_control_cpp/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
