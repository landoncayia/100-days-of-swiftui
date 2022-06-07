import Cocoa

func pickRandom(numbers: [Int]?) -> Int {
    numbers?.randomElement() ?? Int.random(in: 1...100)
}

//let numbers = [1, 3, 6, 10, 15, 21, 28, 36, 45, 55]
let numbers: [Int]? = []
let pick = pickRandom(numbers: numbers)
print(pick)
