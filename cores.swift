import Foundation

#if os(macOS)
    func getLogicalCores() -> Int {
        var count: Int32 = 0
        var size = MemoryLayout<Int32>.size
        sysctlbyname("hw.logicalcpu", &count, &size, nil, 0)
        return Int(count)
    }

    func getPhysicalCores() -> Int {
        var count: Int32 = 0
        var size = MemoryLayout<Int32>.size
        sysctlbyname("hw.physicalcpu", &count, &size, nil, 0)
        return Int(count)
    }
#else
    func getLogicalCores() -> Int {
        ProcessInfo.processInfo.processorCount
    }

    // Count unique (physical id, core id) pairs in /proc/cpuinfo.
    func getPhysicalCores() -> Int {
        // procfs reports a size of 0, so read line by line rather than with String(contentsOfFile:).
        guard let file = fopen("/proc/cpuinfo", "r") else {
            return getLogicalCores()
        }
        defer { fclose(file) }
        var cores = Set<String>()
        var physicalID = "0"
        var buffer: UnsafeMutablePointer<CChar>?
        var capacity = 0
        defer { free(buffer) }
        while getline(&buffer, &capacity, file) > 0, let buffer {
            let line = String(cString: buffer)
            let parts = line.split(separator: ":", maxSplits: 1).map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            guard parts.count == 2 else { continue }
            switch parts[0] {
            case "physical id": physicalID = parts[1]
            case "core id": cores.insert("\(physicalID):\(parts[1])")
            default: break
            }
        }
        return cores.isEmpty ? getLogicalCores() : cores.count
    }
#endif

let logicalCores = getLogicalCores()
let physicalCores = getPhysicalCores()

print("logical cores: \(logicalCores)")
print("physical cores: \(physicalCores)")
