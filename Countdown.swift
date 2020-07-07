import Foundation

// https://stackoverflow.com/questions/40075850/swift-3-find-number-of-calendar-days-between-two-dates

let startDate = "2020-07-06"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let formatedStartDate = dateFormatter.date(from: startDate)
let currentDate = Date()
let differenceOfDate = Calendar.current.dateComponents([.day], from: formatedStartDate!, to: currentDate)

print(differenceOfDate)
