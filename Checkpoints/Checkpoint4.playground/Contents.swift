import Cocoa

enum SquareRootError: Error {
    case outOfBounds, noIntegerRoot
}

func findSquareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw SquareRootError.outOfBounds
    }
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    throw SquareRootError.noIntegerRoot
}

let number = 10000

do {
    let result = try findSquareRoot(of: number)
    print("Square root of \(number) is \(result).")
} catch SquareRootError.outOfBounds {
    print("The provided number is out of bounds. Please try again.")
} catch SquareRootError.noIntegerRoot {
    print("The provided number does not have an integer square root. Please try again.")
} catch {
    print("An unknown error has occurred. Please contact the developer.")
}
