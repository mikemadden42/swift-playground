import Foundation
#if canImport(AppKit)
    import AppKit
#endif

// https://stackoverflow.com/questions/26704852/osx-swift-open-url-in-default-browser#26706355

let url = URL(string: "https://www.google.com")!

#if canImport(AppKit)
    if NSWorkspace.shared.open(url) {
        print("default browser was successfully opened")
    }
#else
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    process.arguments = ["xdg-open", url.absoluteString]
    do {
        try process.run()
        process.waitUntilExit()
        if process.terminationStatus == 0 {
            print("default browser was successfully opened")
        }
    } catch {
        fputs("Error: \(error)\n", stderr)
    }
#endif
