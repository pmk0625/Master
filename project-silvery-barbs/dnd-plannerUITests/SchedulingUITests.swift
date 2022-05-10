//
//  SchedulingUITests.swift
//  Dnd-Planner
//
//  Created by Minkyu Park on 3/8/22.
//

import XCTest
//@testable import SchedulingView

class SchedulingUITests: XCTestCase {
    override func setUpWithError() throws {
        //Each Test Methods in the class
        
        //If failed,
        continueAfterFailure = false
        
        //Initialize
    }
    
    override func tearDownWithError() throws {
        //teardown code goes here
        
    }
    
    func testExample() throws {
        //UI test must launch the application to test
        let app = XCUIApplication()
        app.launch()
        
        //Use XCTAsset and related functions to verify test outputs
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
