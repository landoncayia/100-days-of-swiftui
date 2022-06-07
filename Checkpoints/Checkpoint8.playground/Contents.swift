import Cocoa

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var agent: String { get set }
    var type: String { get set }
    
    func salesSummary()
}

extension Building {
    func salesSummary() {
        print("This is a(n) \(type) with \(rooms) rooms, which costs $\(cost), and your agent is \(agent).")
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    var type = "house"
}

struct Office: Building {
    var rooms: Int {
        seats / 2
    }
    
    var seats: Int
    var cost: Int
    var agent: String
    var type = "office"
}

let house = House(rooms: 4, cost: 250_000, agent: "Marty Jamieson")
let office = Office(seats: 50, cost: 1_200_000, agent: "Michael Scott")

house.salesSummary()
office.salesSummary()
