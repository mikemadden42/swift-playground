#!/bin/sh -x

for PROG in Chapter01 hello sysinfo; do
	swiftc -O -gnone -warnings-as-errors -o ${PROG} ${PROG}.swift
	strip ${PROG}
	echo
done
