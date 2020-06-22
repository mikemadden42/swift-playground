// xcrun -sdk macosx swiftc -o Lookup Lookup.swift
// xcrun -sdk macosx swiftc Lookup.swift

import Foundation

// http://goo.gl/fCg8Lg
let host = CFHostCreateWithName(nil, "www.google.com").takeRetainedValue()
CFHostStartInfoResolution(host, .Addresses, nil)
var success: DarwinBoolean = false
if let addresses = CFHostGetAddressing(host, &success)?.takeUnretainedValue() as NSArray?,
    theAddress = addresses.firstObject as? NSData {
    var hostname = [CChar](count: Int(NI_MAXHOST), repeatedValue: 0)
    if getnameinfo(UnsafePointer(theAddress.bytes), socklen_t(theAddress.length),
        &hostname, socklen_t(hostname.count), nil, 0, NI_NUMERICHOST) == 0 {
            if let numAddress = String.fromCString(hostname) {
                print(numAddress)
            }
    }
}
