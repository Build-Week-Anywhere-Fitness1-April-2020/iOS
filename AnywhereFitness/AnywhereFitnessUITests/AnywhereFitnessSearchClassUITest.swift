//
//  AnywhereFitnessSearchClassUITest.swift
//  AnywhereFitnessUITests
//
//  Created by Christopher Devito on 5/1/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import XCTest

class AnywhereFitnessSearchClassUITest: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testSearchClass() {
        signinClient()

        app.tabBars.buttons["Search"].tap()
        app.textFields["locationSearch"].tap()
        app.buttons["shift"].tap()
        app.keys["N"].tap();app.keys["e"].tap();app.keys["w"].tap()
        app.keys["space"].tap();app.buttons["shift"].tap()
        app.keys["J"].tap();app.keys["e"].tap();app.keys["r"].tap()
        app.keys["s"].tap();app.keys["e"].tap();app.keys["y"].tap()

        app.swipeDown()
        app.buttons["searchButton"].tap()
        app.tables.staticTexts["Introduction to Yoga with Adrienne"].tap()
        app.buttons["viewSchedule"].tap()
        app.tables.staticTexts["Monday"].tap()
        app.buttons["reserve"].tap()
        XCTAssert(app.staticTexts["className"].exists)
    }

    func signinClient() {
        let usernameTextField = app.textFields["Username:"]
        let nKey = app.keys["n"]
        let iKey = app.keys["i"]
        let sKey = app.keys["s"]
        let oKey = app.keys["o"]
        let mKey = app.keys["m"]
        let eKey = app.keys["e"]
        let tKey = app.keys["t"]
        let hkey = app.keys["h"]
        let gKey = app.keys["g"]
        let capNKey = app.keys["N"]
        let wKey = app.keys["w"]
        let shiftButton = app.buttons["shift"]
        let passwordSecureTextField = app.secureTextFields["Password: "]
        let label = app.alerts["Sign In Successful"]
        let exists = NSPredicate(format: "exists == 1")

        app.buttons["clients"].tap()

        usernameTextField.tap()

        sKey.tap();oKey.tap();mKey.tap();eKey.tap()
        tKey.tap();hkey.tap();iKey.tap();nKey.tap()
        gKey.tap();shiftButton.tap();capNKey.tap()
        eKey.tap();wKey.tap()

        passwordSecureTextField.tap()

        sKey.tap();oKey.tap();mKey.tap();eKey.tap()
        tKey.tap();hkey.tap();iKey.tap();nKey.tap()
        gKey.tap();shiftButton.tap();capNKey.tap()
        eKey.tap();wKey.tap()

        app.tap()
        app.buttons["Next"].tap()

        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

        app.alerts["Sign In Successful"].scrollViews.otherElements.buttons["OK"].tap()
    }
}
