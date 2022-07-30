//
//  CrewView.swift
//  Moonshot
//
//  Created by Landon Cayia on 7/8/22.
//

import SwiftUI

struct CrewView: View {
    let crew: [CrewMember]
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Crew")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title.bold())
                .padding(.bottom, 5)
                .padding(.horizontal)
            
            ForEach(crew, id: \.role) {crewMember in
                NavigationLink {
                    AstronautView(astronaut: crewMember.astronaut)
                } label: {
                    Image(crewMember.astronaut.id)
                        .resizable()
                        .frame(width: 351, height: 243)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color(hue: 0.555, saturation: 0.94, brightness: 0.45), lineWidth: 3)
                                .shadow(color: .black, radius: 5, x: 1, y: 1)
                        )
                }
                
                VStack(alignment: .center) {
                    Text(crewMember.astronaut.name)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Text(crewMember.role)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct CrewView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static let crew: [CrewMember] = missions[0].crew.map { member in
        if let astronaut = astronauts[member.name] {
            return CrewMember(role: member.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }
    
    static var previews: some View {
        CrewView(crew: crew)
            .background(.darkBackground)
    }
}
