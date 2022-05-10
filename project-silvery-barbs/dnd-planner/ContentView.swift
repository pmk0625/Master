//
//  ContentView.swift
//  dnd-planner
//
//  Created by Kierstyn Just on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var manager = SchedulingManager()
    var body: some View {
        TabView {
            UserView()
                .tabItem{
                    Image(systemName: "person")
                    Text("User Profile")
                }
            NearbyUsersView()
                .tabItem{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Nearby Users")
                }
            SchedulingList()
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Scheduling List")
                }
            Messaging()
                .tabItem{
                    Image(systemName: "tray.fill")
                    Text("Inbox")
                }
            UserAccountView()
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("Account")
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
