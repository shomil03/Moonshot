//
//  Lisy_View.swift
//  Moonshot
//
//  Created by Shomil Singh on 26/10/23.
//

import SwiftUI

struct List_View: View {
    let Astronauts : [String : Astronauts] = Bundle.main.decode("astronauts.json")
    let mission : [Mission] = Bundle.main.decode("missions.json")
   
    @Binding var toogle_view : ViewMode
    var body: some View {
        VStack{
            NavigationView() {
                ScrollView{
                    LazyVStack() {
                        ForEach(mission) { mission in
                            NavigationLink{
                                MissionView(mission: mission, astronauts: Astronauts)
                            } label: {
                                VStack{
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100 , height: 100)
                                        .padding()
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                        .opacity(0.5)
                                    VStack {
                                        Text(mission.displayname)
                                            .font(.headline)
                                        
                                        
                                            .font(.caption)
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth:.infinity)
                                    .background(.lightBackground)
                                    .foregroundColor(.white)
                                    
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                    
                                )
                            }
                        }
                    }
                    .padding([.vertical,.horizontal])
                }
                .navigationTitle("MoonShot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("toogle")
                        {
                            toogle_view = (toogle_view == .grid) ? .list : .grid
                        }
                    }
                }
                
                

            }
        }
    }
   
}
#Preview {
    List_View(toogle_view: .constant(.list))
}
