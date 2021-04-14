OUTFILE := sysinfo

sysinfo: sysinfo.swift
	swiftc -O -gnone -warnings-as-errors -target x86_64-apple-macos10.12 -o ${OUTFILE}-x86_64 ${OUTFILE}.swift && strip ${OUTFILE}-x86_64
	swiftc -O -gnone -warnings-as-errors -target arm64-apple-macos11 -o ${OUTFILE}-arm64 ${OUTFILE}.swift && strip ${OUTFILE}-arm64
	lipo -create -output ${OUTFILE} ${OUTFILE}-x86_64 ${OUTFILE}-arm64
	codesign -s - $(OUTFILE)
	rm -f $(OUTFILE)-x86_64 $(OUTFILE)-arm64

run: sysinfo
	@./$(OUTFILE)
