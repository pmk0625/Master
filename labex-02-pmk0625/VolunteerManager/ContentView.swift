//
//  ContentView.swift
//  VolunteerManager
//
//  Created by Paul Inventado on 2/23/22.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var hours: String = ""
    @State var manager = VolunteerManager()
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Volunteer Form")
            }
            HStack(alignment: .center) {
                Spacer()
                TextField("Name", text: $name)
                TextField("Hours", text: $hours)
                    .frame(width: 50)
                Spacer()
            }
            HStack(alignment: .center) {
                Button(action: {
                    if let hours = Int(hours) {
                        manager.volunteer(name, for: hours)
                    }
                }) {
                    Text("Add/Update")
                }.padding()
                Button(action: {
                    name = ""
                    hours = ""
                }) {
                    Text("Clear Form")
                }.padding()
            }
            List {
                ForEach(manager.volunteers.keys.sorted(), id: \.self) { name in
                    HStack {
                        if let volunteerHours = manager.volunteers[name] {
                            Text(name)
                            Text(String(volunteerHours))
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
