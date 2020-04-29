//
//  UserControllerTests.swift
//  AnywhereFitnessTests
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import XCTest
@testable import AnywhereFitness

class UserControllerTests: XCTestCase {

    let userController = UserController()

//    override func setUpWithError() throws {
//
//    }

    func testSignUp() {
        let user = UserLogin(username: "itsmeyo",
                             email: "itsmeyo@myplace.com",
                             password: "yepitsme", roles: [Role.instructor.rawValue])
        let client = UserLogin(username: "oyemsti",
                               email: "oyemsti@myplace.com",
                               password: "emstipey",
                               roles: [Role.client.rawValue])
        let expectation = self.expectation(description: "Wait for registration confirmation first one")
        let expectation2 = self.expectation(description: "Wait for registration confirmation second one")
        userController.signUp(with: user) { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        userController.signUp(with: client) { (error) in
            XCTAssertNil(error)
            expectation2.fulfill()
        }
        wait(for: [expectation, expectation2], timeout: 5)
    }

    func testSignUpWithBadInformation() {
        let user = UserLogin(username: "itsmeyo", email: "itsmeyo@myplace.com", password: "yepitsme", roles: ["Bro"])
        let expectation = self.expectation(description: "wait for registration confirmation")
        userController.signUp(with: user) { (error) in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testSignIn() {
        let user = UserSignIn(userName: "itsmeyo",
                             password: "yepitsme",
                             roles: [Role.instructor.rawValue])
        let expectation = self.expectation(description: "Wait for sign in confirmation")
        userController.signIn(with: user) { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}
