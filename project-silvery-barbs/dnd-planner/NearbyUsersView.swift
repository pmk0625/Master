//
//  NearbyUsersView.swift
//  Dnd-Planner
//
//  Created by Kierstyn Just on 3/8/22.
//

import SwiftUI

struct NearbyUsersView: View {
    @StateObject var manager = MapManager()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack { // entire view
                    VStack {
                        HStack { // header bar
                            VStack {
                                Text("\(manager.currentLocation)").bold()
                                Text("Mile Radius: \(Int(manager.mileRadius))")
                            }
                            Spacer()
                            NavigationLink(destination: NearbyUsersSettingsView()) {
                                Text("Filter")
                            }
                        }
                    }.padding()
                    List {
                        ForEach(manager.getFilteredUsers()) { user in
                            HStack {
                                Text(user.username)
                                    .frame(width: geometry.size.width / 4, alignment: Alignment.leading)
                                Text(String(Int(user.milesAway)) + " Miles Away")
                                    .font(.custom("System", size: 14))
                                    .frame(width: geometry.size.width / 4, alignment: Alignment.trailing)
                                HStack {
                                    Button(action: {}) {
                                        Image(systemName: "plus").modifier(UserButtonText())
                                    }.modifier(UserButtons())
                                    Button(action: {}) {
                                        Image(systemName: "envelope").modifier(UserButtonText())
                                    }.modifier(UserButtons())
                                }.frame(width: geometry.size.width / 3)
                            }
                        }
                    }
                }.frame(height: geometry.size.height)
                    .navigationBarTitle("Nearby Users", displayMode: .inline)
                    .navigationBarHidden(false)
            }
        }.environmentObject(manager)
    }
}

struct NearbyUsersView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyUsersView()
        NearbyUsersSettingsView().environmentObject(MapManager())
    }
}

struct NearbyUsersSettingsView: View {
    @EnvironmentObject var manager: MapManager
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Set Radius")) {
                    VStack {
                        Slider(value: $manager.mileRadius, in: 0...50, step: 5)
                        {
                            
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("50")
                        }
                        Text("\(Int(manager.mileRadius)) Miles Away")
                    }
                }
                Section(header: Text("Search Type")) {
                    Toggle("Looking for Party Members", isOn: $manager.lookingForPartyMembers)
                    Toggle("Looking to Join Party", isOn: $manager.lookingToJoinParty)
                }
            }
        }.navigationBarTitle("Filter Settings", displayMode: .inline)
    }
}

// ===== VIEW MODIFIERS =====
struct UserButtons: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(5)
    }
}

struct UserButtonText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(6)
    }
}
