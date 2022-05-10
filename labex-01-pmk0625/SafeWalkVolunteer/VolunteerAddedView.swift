//
//  VolunteerAddedView.swift
//  SafeWalkVolunteer
//
//  Created by Paul Inventado on 2/9/22.
//

import SwiftUI

struct VolunteerAddedView: View {
    /// Retrieve volunteer model from the environment
    @EnvironmentObject var theVolunteer: SafeWalkVolunteer
    var body: some View {
        VStack(alignment: .center) {
            Text("Welcome to SafeWalk,  \(theVolunteer.name)!").font(.largeTitle).padding(.bottom, 20)
            /// Use the ternary operator to decide whether to add s or not (hour vs hours)
            /// See https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID71
            Text("You will be asked to volunteer \(theVolunteer.maxHours) hour \(theVolunteer.maxHours > 1 ? "s": "") a week.").font(.footnote)
        }
    }
}

struct VolunteerAddedView_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerAddedView()
    }
}
