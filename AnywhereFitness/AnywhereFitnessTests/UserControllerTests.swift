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

    func testClientSignUp() {
        let user = UserLogin(username: "unitTesting2",
                             email: "unit2@testing.com",
                             password: "unitTesting2",
                             gender: "Male",
                             displayName: "displayUnitTests2",
                             roles: [Role.client.rawValue])
        let expectation = self.expectation(
            description: "Wait for registration confirmation first one")

        userController.signUp(with: user) { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
    }

    func testInstructorSignUp() {
        let client = UserLogin(username: "instructorTesting2",
                               email: "instructor2@testing.com",
                               password: "instructorTesting2",
                               gender: "Female",
                               displayName: "displayInstructorTests2",
                               roles: [Role.instructor.rawValue])
        let expectation = self.expectation(
            description: "Wait for registration confirmation second one")

        userController.signUp(with: client) { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testClientSignIn() {
        let user = UserSignIn(username: "unitTesting2",
                              password: "unitTesting2",
                              role: Role.client.rawValue)
        let expectation = self.expectation(
            description: "Wait for sign in confirmation")

        userController.signIn(with: user, completion: { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }

    func testInstructorSignIn() {
        let user = UserSignIn(username: "instructorTesting2",
                              password: "instructorTesting2",
                              role: Role.instructor.rawValue)
        let expectation = self.expectation(
            description: "Wait for sign in confirmation")
        userController.signIn(with: user, completion: { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
}
