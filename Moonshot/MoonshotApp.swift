//
//  MoonshotApp.swift
//  Moonshot
//
//  Created by Shomil Singh on 21/09/23.
//

import SwiftUI

@main
struct MoonshotApp: App {
    @State private var toogle_view: ViewMode = .grid
    var body: some Scene {
        WindowGroup {
            ContentView(toogle_view: toogle_view)
        }
    }
}
