//
//  VolunteerManagerTests.swift
//  VolunteerManagerTests
//
//  Created by Paul Inventado on 2/23/22.
//

import XCTest
@testable import VolunteerManager

class VolunteerManagerTests: XCTestCase {

    // TODO: Create your unit tests    
    func testMaxHours(){
        var hours = VolunteerManager ()
        hours.volunteer("Paul", for: 25)
        XCTAssertEqual (hours.volunteers ["Paul"], 20)
    }
    
    func testNegHours(){
        var hours = VolunteerManager ()
        hours.volunteer("Paul", for: -1)
        XCTAssertEqual(hours.volunteers ["Paul"], nil)
    }
    
    func testUpdateHours() {
        var hours = VolunteerManager ()
        hours.volunteer("Paul", for: 5)
        hours.volunteer("Paul", for: 5)
        XCTAssertEqual(hours.volunteers ["Paul"], 10)
    }
    
}
