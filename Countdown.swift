// xcrun -sdk macosx swiftc -o Countdown Countdown.swift
// xcrun -sdk macosx swiftc Countdown.swift

import Foundation

// http://stackoverflow.com/questions/24723431/swift-days-between-two-nsdates
// http://stackoverflow.com/questions/24070450/how-to-get-the-current-timeand-hour-as-datetime-swift

let date = NSDate()
let formatter = NSDateFormatter()
formatter.dateStyle = .LongStyle
formatter.dateFormat = "MM-dd-yyyy"

let today = formatter.stringFromDate(date)
let end = "12-25-2016"

let startDate: NSDate = formatter.dateFromString(today)!
let endDate: NSDate = formatter.dateFromString(end)!

let calendar = NSCalendar.currentCalendar()

let components = calendar.components([.Day], fromDate: startDate, toDate: endDate, options: [])

print("\(components.day) days until Christmas!")
