import Cocoa

// https://stackoverflow.com/questions/26704852/osx-swift-open-url-in-default-browser#26706355

let url = URL(string: "https://www.google.com")!
if NSWorkspace.shared.open(url) {
    print("default browser was successfully opened")
}
