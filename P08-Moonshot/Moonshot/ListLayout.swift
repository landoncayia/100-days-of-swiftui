//
//  MainListView.swift
//  Moonshot
//
//  Created by Landon Cayia on 7/8/22.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts:   astronauts)
                } label: {
                    HStack(spacing: 30) {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        
                        HStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .padding(10)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.5))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(10)
                        }
                        .background(.lightBackground)
                        .clipShape(Capsule())
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

struct MainListView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayout(astronauts: astronauts, missions: missions)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
    }
}
