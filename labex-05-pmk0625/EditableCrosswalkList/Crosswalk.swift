//
//  Crosswalk.swift
//  EditableCrosswalkList
//
//  Created by Paul Inventado on 3/31/22.
//

import Foundation

class CrosswalkManager: ObservableObject {
    @Published var crosswalks: [CrossWalk] = []
    
    init() {
        // Add initial crosswalks for testing
        crosswalks.append(CrossWalk(name: "Titan hall", description: "800 N State College Blvd., Fullerton CA 92831"))
        crosswalks.append(CrossWalk(name: "Titan gym", description: "Gymnasium Campus Dr. Fullerton, CA 92831"))
        crosswalks.append(CrossWalk(name: "ECS building", description: "Campus Dr. Fullerton, CA 92831"))
        // TODO: Model 1 - Add another crosswalk object
    }
}

struct CrossWalk: Identifiable {
    /// The Identifiable protocol requires an id property that should be a unique value
    /// UUID generates a unique random hexadecimal string
    var id = UUID()
    var name: String
    var description: String
}
