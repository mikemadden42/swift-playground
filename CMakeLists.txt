cmake_minimum_required(VERSION 3.15.0)

if(NOT CMAKE_GENERATOR MATCHES "Ninja|Xcode")
  message(FATAL_ERROR "Swift requires the Ninja or Xcode generator (e.g. cmake -GNinja ..)")
endif()

# CMake ignores CMAKE_OSX_DEPLOYMENT_TARGET for Swift, so pass the minimum
# macOS version via the target triple, matching the Makefile.
if(CMAKE_HOST_APPLE AND NOT CMAKE_Swift_COMPILER_TARGET)
  if(CMAKE_OSX_ARCHITECTURES)
    set(arch ${CMAKE_OSX_ARCHITECTURES})
  else()
    execute_process(COMMAND uname -m
                    OUTPUT_VARIABLE arch
                    OUTPUT_STRIP_TRAILING_WHITESPACE)
  endif()
  if(arch STREQUAL "arm64")
    set(CMAKE_Swift_COMPILER_TARGET arm64-apple-macosx11.0)
  else()
    set(CMAKE_Swift_COMPILER_TARGET x86_64-apple-macosx10.15)
  endif()
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

set(strip_configs $<OR:$<CONFIG:Release>,$<CONFIG:MinSizeRel>>)

foreach(program ${PROGRAMS})
  add_executable(${program} ${program}.swift)
  add_custom_command(TARGET ${program} POST_BUILD
                     COMMAND $<${strip_configs}:${CMAKE_STRIP}>
                             $<${strip_configs}:$<TARGET_FILE:${program}>>
                     COMMAND_EXPAND_LISTS
                     VERBATIM)
endforeach()
