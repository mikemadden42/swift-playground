//
//  Chapter01.swift
//
//
//  Created by Michael Madden on 4/10/15.
//
//

// swiftc Chapter01.swift
// ./Chapter01

// Int & Double variables
var dozen = 12
var meaning = 42.0
print(dozen)
print(meaning)

// String variable
var str = "Hello, world!"
print(str)

// Constants
let count = dozen

// Limits
print(Int.min)
print(Int.max)

// Conversions
var key = "1234"
var numkey = Int(key) ?? 0
print(key)
print(numkey)

// Explicit type
var num: Double = 3
print(num)

// Strings
var greeting1 = "Hello "
var greeting2 = "Swift"
print(greeting1 + greeting2)

// Math
print(42 + 42)
print(42 - 10)
print(6 * 7)
print(9 / 2)
print(9.0 / 2.0)
print(9 % 2)

// Scientific notation
let avogadro = 6.02e23
print(avogadro)

// Large numbers
let million = 1_000_000
print(million)

// Booleans
let num1 = 42
let num2 = 18
let str1 = "foo"
let str2 = "bar"
print(num1 > num2)
print(num1 < num2)
print(num1 == num2)
print(num1 != num2)
print(str1 == str2)

// Easy printing
let city = "Chicago"
let food = "pizza"
let restaurant = "Giordano's"
let year = "2012"
print("We last visited \(city) in \(year).")
print("We went to \(restaurant) last time & ordered \(food).")
