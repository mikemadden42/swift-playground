// xcrun -sdk macosx swiftc -o Lookup Lookup.swift
// xcrun -sdk macosx swiftc Lookup.swift

import Foundation

// http://goo.gl/fCg8Lg
let host = CFHostCreateWithName(nil, "www.stackoverflow.com" as CFString).takeRetainedValue()
CFHostStartInfoResolution(host, .addresses, nil)
var success: DarwinBoolean = false
if let addresses = CFHostGetAddressing(host, &success)?.takeUnretainedValue() as NSArray? {
    for case let theAddress as NSData in addresses {
        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
        if getnameinfo(theAddress.bytes.assumingMemoryBound(to: sockaddr.self), socklen_t(theAddress.length),
                       &hostname, socklen_t(hostname.count), nil, 0, NI_NUMERICHOST) == 0
        {
            let numAddress = String(cString: hostname)
            print(numAddress)
        }
    }
}
