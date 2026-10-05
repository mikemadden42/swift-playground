import Foundation

var hints = addrinfo()
#if os(Linux)
    hints.ai_socktype = Int32(SOCK_STREAM.rawValue)
#else
    hints.ai_socktype = SOCK_STREAM
#endif

var result: UnsafeMutablePointer<addrinfo>?
let status = getaddrinfo("www.stackoverflow.com", nil, &hints, &result)
guard status == 0 else {
    fputs("Error: \(String(cString: gai_strerror(status)))\n", stderr)
    exit(1)
}
defer { freeaddrinfo(result) }

var info = result
while let current = info {
    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
    if getnameinfo(current.pointee.ai_addr, current.pointee.ai_addrlen,
                   &hostname, socklen_t(hostname.count), nil, 0, NI_NUMERICHOST) == 0
    {
        print(String(cString: hostname))
    }
    info = current.pointee.ai_next
}
