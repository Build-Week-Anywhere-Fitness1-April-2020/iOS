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
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testLogInInstructor() {
        let usernameTextField = app.textFields["Username:"]
        let nKey = app.keys["n"]
        let iKey = app.keys["I"]
        let sKey = app.keys["s"]
        let oKey = app.keys["o"]
        let mKey = app.keys["m"]
        let eKey = app.keys["e"]
        let shiftButton = app.buttons["shift"]
        let passwordSecureTextField = app.secureTextFields["Password: "]
        let label = app.alerts["Sign In Successful"]
        let exists = NSPredicate(format: "exists == 1")
        let label2 = app.staticTexts["anywhereFitnessI"]

        app.buttons["instructors"].tap()

        usernameTextField.tap()

        sKey.tap();oKey.tap();mKey.tap();eKey.tap()
        shiftButton.tap();iKey.tap();nKey.tap();sKey.tap()

        passwordSecureTextField.tap()

        sKey.tap();oKey.tap();mKey.tap();eKey.tap()
        shiftButton.tap();iKey.tap();nKey.tap();sKey.tap()

        app.tap()
        app.buttons["Next"].tap()

        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

        app.alerts["Sign In Successful"].scrollViews.otherElements.buttons["OK"].tap()
        XCTAssert(label2.exists)

    }

    func testLogInClient() {
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
        let label2 = app.staticTexts["anywhereFitnessC"]

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
        XCTAssert(label2.exists)
    }

    func testBackButton() {
        let backButton = app.navigationBars["Anwhere Fitness"].buttons["Back"]
        let label = app.staticTexts["anywhereLanding"]

        app.staticTexts["For Instructors"].tap()
        backButton.tap()
        app.staticTexts["For Clients"].tap()
        backButton.tap()
        XCTAssert(label.exists)
    }
}
