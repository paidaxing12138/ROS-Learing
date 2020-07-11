cmake_minimum_required(VERSION 2.8.3)
project(service_demo)

find_package(catkin REQUIRED   roscpp rospy std_msgs message_generation)


add_service_files(
  FILES
  Greeting.srv
)

generate_messages(DEPENDENCIES
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS
  message_runtime
)

include_directories(
  include ${catkin_INCLUDE_DIRS}
)

add_executable(client
  src/client.cpp
)
add_dependencies(client ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(client
  ${catkin_LIBRARIES}
)

add_executable(server
  src/server.cpp
)
add_dependencies(server ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(server
  ${catkin_LIBRARIES}
)