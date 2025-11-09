# This is a file for testing syntax highlighting.
cmake_minimum_required(VERSION 3.13)
project(hello-kit VERSION 0.0.1 LANGUAGES C)

set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/")
file(GLOB_RECURSE SOURCES "${SOURCE_DIR}/*.c")

add_executable(hello-kit SOURCES)

find_package(assimp CONFIG)
target_link_libraries(hello-kit assimp)

option("ENABLE_TESTS" OFF)
if(ENABLE_TESTS)
  add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/tests/")
endif()
