cmake_minimum_required(VERSION 2.8)

project(flexbison-project)

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

BISON_TARGET(parse parse.y ${CMAKE_CURRENT_BINARY_DIR}/parse.c)
FLEX_TARGET(scan scan.l  ${CMAKE_CURRENT_BINARY_DIR}/scan.c)
ADD_FLEX_BISON_DEPENDENCY(scan parse)

include_directories(AFTER ${FLEX_INCLUDE_DIRS} ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})

add_definitions(-g)

set(TEST_SOURCES
  test.c
  )

message("Bison output: ${BISON_parse_OUTPUTS}")
message("Flex output: ${FLEX_scan_OUTPUTS}")

add_executable(simple ${FLEX_scan_OUTPUTS} ${BISON_parse_OUTPUTS} ${TEST_SOURCES})
target_link_libraries(simple)


