#!/bin/sh -x

for PROG in Countdown Lookup cores hello launch newpass sysinfo; do
	swiftc -O -gnone -warnings-as-errors -target x86_64-apple-macos10.12 -o ${PROG}-x86_64 ${PROG}.swift && strip ${PROG}-x86_64
	swiftc -O -gnone -warnings-as-errors -target arm64-apple-macos11 -o ${PROG}-arm64 ${PROG}.swift && strip ${PROG}-arm64
	lipo -create -output ${PROG} ${PROG}-x86_64 ${PROG}-arm64
	rm ${PROG}-x86_64 ${PROG}-arm64
	echo
done
