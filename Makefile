all: countdown hello launch lookup sysinfo

countdown: Countdown.swift
	swiftc -O -gnone -warnings-as-errors -target x86_64-apple-macos10.12 -o countdown-x86_64 Countdown.swift && strip countdown-x86_64
	swiftc -O -gnone -warnings-as-errors -target arm64-apple-macos11 -o countdown-arm64 Countdown.swift && strip countdown-arm64
	lipo -create -output countdown countdown-x86_64 countdown-arm64
	codesign -s - countdown
	rm -f countdown-x86_64 countdown-arm64

hello: hello.swift
	swiftc -O -gnone -warnings-as-errors -target x86_64-apple-macos10.12 -o hello-x86_64 hello.swift && strip hello-x86_64
	swiftc -O -gnone -warnings-as-errors -target arm64-apple-macos11 -o hello-arm64 hello.swift && strip hello-arm64
	lipo -create -output hello hello-x86_64 hello-arm64
	codesign -s - hello
	rm -f hello-x86_64 hello-arm64

launch: launch.swift
	swiftc -O -gnone -warnings-as-errors -target x86_64-apple-macos10.12 -o launch-x86_64 launch.swift && strip launch-x86_64
	swiftc -O -gnone -warnings-as-errors -target arm64-apple-macos11 -o launch-arm64 launch.swift && strip launch-arm64
	lipo -create -output launch launch-x86_64 launch-arm64
	codesign -s - launch
	rm -f launch-x86_64 launch-arm64

lookup: Lookup.swift
	swiftc -O -gnone -warnings-as-errors -target x86_64-apple-macos10.12 -o lookup-x86_64 Lookup.swift && strip lookup-x86_64
	swiftc -O -gnone -warnings-as-errors -target arm64-apple-macos11 -o lookup-arm64 Lookup.swift && strip lookup-arm64
	lipo -create -output lookup lookup-x86_64 lookup-arm64
	codesign -s - lookup
	rm -f lookup-x86_64 lookup-arm64

sysinfo: sysinfo.swift
	swiftc -O -gnone -warnings-as-errors -target x86_64-apple-macos10.12 -o sysinfo-x86_64 sysinfo.swift && strip sysinfo-x86_64
	swiftc -O -gnone -warnings-as-errors -target arm64-apple-macos11 -o sysinfo-arm64 sysinfo.swift && strip sysinfo-arm64
	lipo -create -output sysinfo sysinfo-x86_64 sysinfo-arm64
	codesign -s - sysinfo
	rm -f sysinfo-x86_64 sysinfo-arm64
