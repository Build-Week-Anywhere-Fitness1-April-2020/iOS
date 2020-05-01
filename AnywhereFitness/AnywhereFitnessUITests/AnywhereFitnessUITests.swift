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
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }
}
