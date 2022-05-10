//
//  SafeWalkVolunteerApp.swift
//  An application that asks a user to volunteer to the SafeWalk program
//  and displays their volunteer hours per week.
//
//  Created by Paul Inventado on 2/9/22.
//

import SwiftUI

@main

/// Main Application view
struct SafeWalkVolunteerApp: App {
    var body: some Scene {
        WindowGroup {
           VolunteerView()
        }
    }
}
