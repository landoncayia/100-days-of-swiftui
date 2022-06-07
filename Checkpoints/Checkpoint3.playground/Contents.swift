import Cocoa

// Fizz Buzz program

// Loop from 1 to 100
for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) { // Multiple of 3 and 5, print "FizzBuzz"
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) { // Multiple of 3 only, print "Fizz"
        print("Fizz")
    } else if i.isMultiple(of: 5) { // Multiple of 5 only, print "Buzz"
        print("Buzz")
    } else { // Else, print the number
        print(i)
    }
}
