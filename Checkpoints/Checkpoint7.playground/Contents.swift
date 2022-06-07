import Cocoa

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak() {
        assertionFailure("This should never be called.")
    }
}

class Dog: Animal {
    override func speak() {
        print("Woof!")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("Bark!")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("Yip!")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    override func speak() {
        print("Meow")
    }
}

final class Persian: Cat {
    override func speak() {
        print("Purr")
    }
}

final class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
}

let animal = Animal(legs: 4)
let dog = Dog(legs: 4)
let corgi = Corgi(legs: 4)
let poodle = Poodle(legs: 4)
let persian = Persian(legs: 4, isTame: true)
let lion = Lion(legs: 4, isTame: false)

dog.speak()
corgi.speak()
poodle.speak()
persian.speak()
lion.speak()
print(persian.isTame)
print(lion.isTame)
