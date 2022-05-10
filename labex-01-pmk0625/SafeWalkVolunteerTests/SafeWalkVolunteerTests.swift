//
//  SafeWalkVolunteerTests.swift
//  SafeWalkVolunteerTests
//
//  Created by Paul Inventado on 2/9/22.
//

import XCTest
@testable import SafeWalkVolunteer

class SafeWalkVolunteerTests: XCTestCase {

    func testEmptyInitializer() {
        let volunteer = SafeWalkVolunteer()
        XCTAssertEqual(volunteer.name, "")
        XCTAssertEqual(volunteer.age, 0)
    }
    
    func testNonEmptyInitializer() {
        let volunteer = SafeWalkVolunteer(name: "TestUser", age: 50)
        XCTAssertEqual(volunteer.name, "TestUser")
        XCTAssertEqual(volunteer.age, 50)
    }
    
    func testNameReplace() {
        let volunteer = SafeWalkVolunteer()
        volunteer.name = "TestUser"
        XCTAssertEqual(volunteer.name, "TestUser")
    }
    
    func testAgeReplace() {
        let volunteer = SafeWalkVolunteer()
        volunteer.age = 30
        XCTAssertEqual(volunteer.age, 30)
    }
    
    func testMaxHoursLT18() {
        let volunteer = SafeWalkVolunteer(name: "TestUser", age: 10)
        XCTAssertEqual(volunteer.maxHours, 1)
    }
    
    func testMaxHoursLT18BelowEdge() {
        let volunteer = SafeWalkVolunteer(name: "TestUser", age: 17)
        XCTAssertEqual(volunteer.maxHours, 1)
    }
    
    func testMaxHoursGT18() {
        let volunteer = SafeWalkVolunteer(name: "TestUser", age: 20)
        XCTAssertEqual(volunteer.maxHours, 3)
    }
    
    func testMaxHoursGT18AboveEdge() {
        let volunteer = SafeWalkVolunteer(name: "TestUser", age: 18)
        XCTAssertEqual(volunteer.maxHours, 3)
    }
    
    
    
}
