//
//  Scheduling.swift
//  Dnd-Planner
//
//  Created by Minkyu Park on 2/25/22.
//

import Foundation

class SchedulingManager: ObservableObject {
    @Published var scheduling: [Schedule] = []
    init() {
        scheduling.append(Schedule(name: "Ray", availability: "FROM 7 pm TO 10 pm"))
        scheduling.append(Schedule(name: "Kally", availability: "FROM 5 pm TO 8 pm"))
    }
}

struct Schedule: Identifiable {
    var id = UUID()
    var name: String
    var availability: String
}



