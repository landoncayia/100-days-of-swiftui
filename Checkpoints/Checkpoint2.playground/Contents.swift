import Cocoa

// Create an array of strings
let rainbow = ["red", "red", "orange", "yellow", "green", "green", "blue", "blue", "violet"]

// Print the number of items in the array
print(rainbow.count)

// Print the number of *unique* items in the array
print(Set(rainbow).count)
