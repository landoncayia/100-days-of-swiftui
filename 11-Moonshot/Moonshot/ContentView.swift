//
//  ContentView.swift
//  Moonshot
//
//  Created by Landon Cayia on 7/5/22.
//

import SwiftUI

struct ContentView: View {
    // false = list mode; true = grid mode
    @State private var showingGrid = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid == true {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    withAnimation {
                        showingGrid.toggle()
                    }
                } label: {
                    if showingGrid == true {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "square.grid.2x2.fill")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
