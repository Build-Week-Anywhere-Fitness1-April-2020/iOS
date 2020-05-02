//
//  AnywhereFitnessCreateClassUITests.swift
//  AnywhereFitnessUITests
//
//  Created by Christopher Devito on 5/1/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//
// swiftlint:disable function_body_length
import XCTest

class AnywhereFitnessCreateClassUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testCreateClass() {
        let key2 = app.keys["2"]
        let key5 = app.keys["5"]
        let key0 = app.keys["0"]
        let key7 = app.keys["7"]
        let keyColon = app.keys[":"]
        let capTKey = app.keys["T"]
        let eKey = app.keys["e"]
        let sKey = app.keys["s"]
        let tKey = app.keys["t"]
        let spaceKey = app.keys["space"]
        let moreKey = app.keys["more"]
        let classsizeTextField = app.textFields["classSize"]

        signinInstructor()

        app.tabBars.buttons["Create Class"].tap()
        classsizeTextField.tap()
        key2.tap();key5.tap()

        app.textFields["classLength"].tap()
        key2.tap();key5.tap()

        app.textFields["className"].tap()
        app.buttons["shift"].tap()
        app.keys["Y"].tap();app.keys["o"].tap()
        app.keys["g"].tap();app.keys["a"].tap()
        spaceKey.tap()
        app.keys["f"].tap();app.keys["o"].tap()
        app.keys["r"].tap()
        spaceKey.tap()
        app.keys["m"].tap();app.keys["e"].tap()

        app.tap()
        //app.staticTexts["Next"].tap()
        app.buttons["createNext1"].tap()
        app.textViews["classDescription"].tap()
        capTKey.tap();eKey.tap()
        sKey.tap();tKey.tap()

        //app.tap()
        app.swipeDown()
        app.buttons["createNext2"].tap()
        app.textFields["classCost"].tap()
        key2.tap();key5.tap()

        app.textViews["equipment"].tap()
        capTKey.tap();eKey.tap()
        sKey.tap();tKey.tap()

        app.textFields["classTime"].tap()
        moreKey.tap();key7.tap()
        keyColon.tap();key0.tap()
        key0.tap()

        app.tap()
        app.staticTexts["Sunday"].tap()
        app.staticTexts["Thursday"].tap()

        app.buttons["createNext3"].tap()
        app.textFields["streetAddress"].tap()
        tKey.tap();eKey.tap()
        sKey.tap();tKey.tap()

        app.textFields["city"].tap()
        tKey.tap();eKey.tap()
        sKey.tap();tKey.tap()

        app.textFields["state"].tap()
        tKey.tap();eKey.tap()
        sKey.tap();tKey.tap()

        app.textFields["zipCode"].tap()
        key5.tap();key2.tap();key7.tap()
        key0.tap();key5.tap()

        app.tap()
        app.buttons["createNext4"].tap()
        app.textViews["arrivalInfo"].tap()
        capTKey.tap();eKey.tap()
        sKey.tap();tKey.tap()

        app.textViews["additionalInfo"].tap()
        capTKey.tap();eKey.tap()
        sKey.tap();tKey.tap()

        app.swipeDown()
        app.buttons["createNext5"].tap()

        XCTAssert(app.staticTexts["anywhereIFinished"].exists)
    }

    func signinInstructor() {
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
    }
// swiftlint:enable function_body_length
}
