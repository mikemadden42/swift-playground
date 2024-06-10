import Foundation

func getSysctlValue(for name: String) -> Int {
    var size = 0
    sysctlbyname(name, nil, &size, nil, 0)
    var result = [CChar](repeating: 0, count: size)
    sysctlbyname(name, &result, &size, nil, 0)
    let value = String(cString: result)
    return Int(value) ?? 0
}

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

let logicalCores = getLogicalCores()
let physicalCores = getPhysicalCores()

print("logical cores: \(logicalCores)")
print("physical cores: \(physicalCores)")
