cmake_minimum_required(VERSION 3.15.0)

project(swift-playgorund LANGUAGES Swift)

set(PROGRAMS
    Countdown
    Lookup
    hello
    launch
    sysinfo
    )

foreach(program ${PROGRAMS})
  add_executable(${program} ${program}.swift)
endforeach(program)
