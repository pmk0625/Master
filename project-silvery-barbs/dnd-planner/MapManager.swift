//
//  MapManager.swift
//  Dnd-Planner
//
//  Created by Kierstyn Just on 2/27/22.
//

//Create classes to represent information and relationships in your assigned feature.
//Create unit tests to check your structures and classes.
//Create a screen to show how users will use your assigned feature.
//Document your progress.

import Foundation
import SwiftUI

class nearbyUser: ObservableObject, Identifiable {
    @Published var username: String
    @Published var milesAway: Float
    
    init(name: String, miles: Float) {
        username = name
        milesAway = miles
    }
    
    deinit {}
}

class MapManager: ObservableObject {
    @Published var nearbyUsers: [nearbyUser] = []
    @Published var currentLocation: String
    @Published var mileRadius: Float
    @Published var lookingToJoinParty: Bool
    @Published var lookingForPartyMembers: Bool
    
    init() {
        currentLocation = "Fullerton, CA"
        mileRadius = 50
        lookingToJoinParty = true
        lookingForPartyMembers = false
        
        // initilize list with sample data
        nearbyUsers.append(nearbyUser(name: "Ellie", miles: 0))
        nearbyUsers.append(nearbyUser(name: "Draco", miles: 2))
        nearbyUsers.append(nearbyUser(name: "Ada", miles: 8))
        nearbyUsers.append(nearbyUser(name: "Akuma", miles: 10))
        nearbyUsers.append(nearbyUser(name: "Puu", miles: 12))
        nearbyUsers.append(nearbyUser(name: "Zorro", miles: 45))
        nearbyUsers.append(nearbyUser(name: "Lilith", miles: 45))
    }
    
    deinit {}
    
    // returns list of nearby users filtered by user set mile radius
    func getFilteredUsers() -> [nearbyUser] {
        var filteredUsers: [nearbyUser] = []
        
        for user in nearbyUsers {
            if user.milesAway <= mileRadius {
                filteredUsers.append(user)
            }
        }
        
        return filteredUsers
    }
    
}
