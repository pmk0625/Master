//
//  ContentView.swift
//  EditableCrosswalkList
//
//  Created by Paul Inventado on 3/31/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var manager = CrosswalkManager()
    var body: some View {
        // TODO: Model 4 - Replace VStack with TabView
        TabView {
            EditableCrosswalkList()
                .tabItem {
                    Image(systemName: "car")
                    Text("Crosswalks")
                }
            CrossWalkInfo()
                .tabItem {
                    Image(systemName: "info")
                    Text("Crosswalk Info")
                }
            // TODO: Model 4 - Add AddCrossWalk as a TabView
            AddCrossWalk()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add crosswalk")
                }
        }

        .environmentObject(manager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
