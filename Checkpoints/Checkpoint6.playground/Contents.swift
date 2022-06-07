import Cocoa

struct Car {
    let model: String
    let seats: Int
    let maximumGears: Int
    private(set) var gear = 1 {
        didSet {
            print("Shifted from \(oldValue) to \(gear)!")
        }
    }
    
    mutating func changeGear(difference: Int) {
        if difference > 0 {
            print("Shifting up...")
        } else if difference < 0 {
            print("Shifting down...")
        } else {
            print("Nothing happened.")
            return
        }
        
        if gear + difference < 1 {
            gear = 1
        } else if gear + difference > maximumGears {
            gear = maximumGears
        } else {
            gear += difference
        }
    }
}

var car = Car(model: "Honda Accord", seats: 5, maximumGears: 5)
car.changeGear(difference: 2)
car.changeGear(difference: -3)
car.changeGear(difference: 0)
