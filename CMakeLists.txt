cmake_minimum_required(VERSION 3.15.0)

if(NOT CMAKE_GENERATOR MATCHES "Ninja|Xcode")
  message(FATAL_ERROR "Swift requires the Ninja or Xcode generator (e.g. cmake -GNinja ..)")
endif()

project(swift-playground LANGUAGES Swift)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

set(PROGRAMS
    Countdown
    Lookup
    cores
    hello
    launch
    newpass
    sysinfo
    )

foreach(program ${PROGRAMS})
  add_executable(${program} ${program}.swift)
endforeach(program)
