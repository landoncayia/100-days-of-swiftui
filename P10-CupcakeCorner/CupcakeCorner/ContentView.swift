//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Landon Cayia on 7/30/22.
//

import SwiftUI

class User: ObservableObject, Codable {
    // enum conforming to CodingKey tells Swift what to saev and load via cases
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Landon Cayia"
    
    // required enforces that subclasses must override the initializer
    // alternatively, mark class as final
    required init(from decoder: Decoder) throws {
        // ask the Decoder instance for a container matching keys; crash if not found
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // read values from container
        name = try container.decode(String.self, forKey: .name)
    }
    
    // opposite of decoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
