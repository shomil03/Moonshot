//
//  ContentView.swift
//  Moonshot
//
//  Created by Shomil Singh on 21/09/23.
//

import SwiftUI

struct ContentView: View {
    let Astronauts : [String : Astronauts] = Bundle.main.decode("astronauts.json")
    let mission : [Mission] = Bundle.main.decode("missions.json")
    @State var view_type = true
    @State var column = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View{
        VStack{
            NavigationView() {
                ScrollView{
                    LazyVGrid(columns: column) {
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
            }
        }
    }
    
//    let layout = [
//        GridItem(.adaptive(minimum: 80,maximum: 140))
//    ]
//    var body: some View {
//        NavigationView()
//        {
//            VStack{
//
//                GeometryReader{geo in
//                    Image("Example")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: geo.size.width * 0.8)
//                        .frame(width: geo.size.width)
//
//                }
//                .padding()
//                //            regular stack make views immediately
//                //            ScrollView{
//                //                VStack(spacing: 10){
//                //                    ForEach(0..<100){
//                //                        Text("Row : \($0)")
//                //                            .font(.title)
//                //                    }
//                //                }
//                //                .frame(maxWidth: .infinity)
//                //                Lazy stack adds views on demand i.e. they add when they are required also they take up all available space unlike regular Stack.
//                //                LazyVStack(){
////                List(0..<101){ row in
////                    NavigationLink{
////                        Text("details of \(row)")
////                    }label: {
////                        Text("Row \(row)")
////                    }
////                }
//
//                //                }
//                //            }
//                ScrollView(.horizontal){
//                    LazyHGrid(rows: layout){
//                        ForEach(0..<2001){row in
//                            Text("\(row)")
//
//                        }
//                    }
//                    .padding()
//                }
//
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
