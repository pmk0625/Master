//
//  VolunteerView.swift
//  View for adding a new volunteer
//
//  Created by Paul Inventado on 2/9/22.
//

import SwiftUI

struct VolunteerView: View {
    /// Store name and age values of the volunteer for the UI
    @State private var name: String = ""
    @State private var age: String = ""

    /// Volunteer model
    @State private var theVolunteer = SafeWalkVolunteer()
    
    /// Manage navigation and alerts
    @State private var doneVolunteering = false
    @State private var ageHasError = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Volunteer for SafeWalk today!").font(.largeTitle)
                        .padding(.bottom, 5)
                    Text("Provide your details and click on Volunteer!")
                        .font(.footnote)
                }.padding(.bottom, 40)
                HStack{
                    VStack(alignment: .trailing) {
                        Text("Name: ").padding(.bottom, 10)
                        Text("Age: ")
                    }
                    VStack {
                        TextField("Full name", text: $name).padding(.bottom, 10)
                        TextField("Age", text: $age)
                    }
                }.padding(.bottom, 40)
                HStack {
                    NavigationLink(destination: VolunteerAddedView(), isActive: $doneVolunteering) { EmptyView() }
                    Button("Volunteer!", action: {
                        /// If age is valid navigate to the VolunteerAddedView
                        /// otherwise show an alert message
                        if let verifiedAge = Int(age) {
                            theVolunteer.name = name
                            theVolunteer.age = verifiedAge
                            doneVolunteering = true
                        } else {
                            ageHasError = true
                        }
                        
                    }).alert("Invalid age", isPresented: $ageHasError) {
                        Button("Ok", role: .cancel) { }
                    }
                        .foregroundColor(.white)
                        .padding(15)
                        .background(.blue)
                        .clipShape(Capsule())
                }
            }.padding()
        }.navigationTitle("SafeWalk Volunteer")
            .environmentObject(theVolunteer) /// Store Volunteer model in the environment
    }
}

struct VolunteerView_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerView()
    }
}
