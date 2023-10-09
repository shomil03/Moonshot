//
//  MissionView.swift
//  Moonshot
//
//  Created by Shomil Singh on 04/10/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember{
        let role : String
        let astronauts : Astronauts
    }
    let mission : Mission
    
    let crew : [CrewMember]
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    
                    VStack(alignment: .leading) {
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission highlights :")
                            .font(.title.bold())
                            .padding(.bottom,5)
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom,5)
                        
                    }
                    .padding(.horizontal)
                }
                ScrollView(.horizontal , showsIndicators: false) {
                    
                    HStack {
                        ForEach(crew , id:\.role) { crew in
                            NavigationLink{
                                AstronautView(astronaut: crew.astronauts)
                            } label: {
                                HStack{
                                    Image(crew.astronauts.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(Capsule())
                                        .overlay(
                                            Capsule().strokeBorder( .white,lineWidth: 1)
                                        )
                                    VStack(alignment: .leading){
                                        Text(crew.astronauts.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text(crew.role)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayname)
        .background(.darkBackground)
    }
    init(mission: Mission, astronauts: [String : Astronauts]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronauts: astronaut)
            } else {
                fatalError("Cannot find \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions : [Mission] = Bundle.main.decode("missions.json")
    static let astronaut : [String : Astronauts] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission : missions[0], astronauts: astronaut)
            .preferredColorScheme(.dark)
    }
}
