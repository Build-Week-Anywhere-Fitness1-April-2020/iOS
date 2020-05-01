//
//  AnywhereFitnessUITests.swift
//  AnywhereFitnessUITests
//
//  Created by Christopher Devito on 5/1/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import XCTest
@testable import AnywhereFitness

class AnywhereFitnessUITests: XCTestCase {

    let app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {

        

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
