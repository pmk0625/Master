//
//  ContentView.swift
//  VolunteerIDMaker
//
//  Created by Paul Inventado on 2/25/22.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var address: String = ""
    @State var age: String = ""
    var body: some View {
        // TODO: Enclose this entire VStack with GeometryReader in Model 3
        GeometryReader { geometry in
            VStack{
            // TODO: Add frame method call to this VStack in Model 3
                VStack {
                    Text("SafeWalk Volunteer")
                        .font(.custom("Courier New", size: 30))
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                    HStack (spacing: 0) { // Variation 5
                        Text("Name5:")
                            .frame(width: 100)
                            .padding(.leading, 20)
                            .font(.custom("Courier New", size: 18))
                        TextField("Name", text: $name)
                            .frame(width: 200)
                            .padding(.leading, 10)
                        Spacer()
                    }
                    HStack (spacing: 0) {
                        Text("Address: ")
                            .frame(width: 100)
                            .padding(.leading, 20)
                            .font(.custom("Courier New", size: 18))
                        TextField("Address", text: $address)
                            .frame(width: 200)
                            .padding(.leading, 10)
                        Spacer()
                    }
                    HStack (spacing: 0) {
                        Text("Age: ")
                            .frame(width: 100)
                            .padding(.leading, 20)
                            .font(.custom("Courier New", size: 18))
                        TextField("Age", text: $age)
                            .frame(width: 200)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }.frame(height: geometry.size.height / 3)
                Spacer()
                VStack {
                    Text("Sample ID")
                        .font(.custom("Courier New", size: 30))
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                    VStack (spacing: 0){
                        Text("Safewalk volunteer | California")
                            .bold()
                            .padding(.top)
                        HStack (spacing: 0) {
                            Text("😁")
                                .font(.custom("Courier New", size: 100))
                                .padding(.leading, 10)
                            VStack {
                                TextField ("Name", text: $name)
                                    .padding(.leading, 10)
                                TextField ("Address", text: $address)
                                    .padding(.leading, 10)
                                VStack {
                                    HStack{
                                        Text("Age: ")
                                            .bold()
                                            .padding()
                                        TextField ("Age", text: $age)
                                    }.frame(height: geometry.size.height / 15)
                                }
                            }
                        }.frame(height: geometry.size.height / 5)
                    }
                    .background(Color.yellow)
                    .border(Color.black)
                    .padding()
                }.frame(height: geometry.size.height / 2)
                
            /* TODO: Replace the entire Text VStack below with sub view provided in Model 2
             */
                VStack {
                   Information(name: $name, address: $address,
                       age: $age)
                }
            }
        }
    }
}

// TODO: Add Information structure provided in Model 2
struct Information: View {
    @Binding var name: String
    @Binding var address: String
    @Binding var age: String
    var body: some View {
        Text(name)
        Text(address)
        Text(age)
    }
}

// TODO: Add custom modifier below then use it to customizes your views for Model 5

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
