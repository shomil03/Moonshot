//
//  ContentView.swift
//  Moonshot
//
//  Created by Shomil Singh on 21/09/23.
//

import SwiftUI
enum ViewMode {
    case grid
    case list
}

struct ContentView: View {
    let Astronauts : [String : Astronauts] = Bundle.main.decode("astronauts.json")
    let mission : [Mission] = Bundle.main.decode("missions.json")
    @State var column = [
        GridItem(.adaptive(minimum: 150))
    ]
   
   
    @State var toogle_view : ViewMode
    var body: some View{
        
        VStack{
            NavigationView() {
                VStack{
                    if(toogle_view == .grid)
                    {
                        Grid_View(toogle_view: $toogle_view)
                    }
                    else
                    {
                        List_View(toogle_view: $toogle_view)
                    }

                        
                }
                
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
//    func print_view(view_type : String)
//    {
//        print("enabling \(view_type)")
//    }
}

struct ContentView_Previews: PreviewProvider {
    @State private static var toggleViewState: ViewMode = .grid
    static var previews: some View {
        ContentView(toogle_view: toggleViewState)
    }
}
